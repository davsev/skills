#!/usr/bin/env bash
# Sleep until the usage-limit reset time, then relaunch Claude Code and
# continue the checkpointed work. Launched detached by the auto-continue
# skill:
#   nohup bash .claude/skills/auto-continue/scripts/resume-at.sh [--handoff] <when> \
#     >> .claude/auto-continue/resume.log 2>&1 &
#
# --handoff  start a brand-new session (clean conversation context) instead
#            of resuming the old one with --continue; the checkpoint file is
#            the only context carried over.
#
# <when> may be:
#   - "now"                    fire immediately (typical with --handoff)
#   - epoch seconds            e.g. 1751900400
#   - HH:MM (24h)              e.g. 16:00   (tomorrow if already past)
#   - anything `date -d` parses, e.g. "3pm", "2026-07-07 16:00"
#
# If Claude is still rate-limited when it fires, it backs off 10 minutes and
# retries, up to MAX_RETRIES times.

set -u

HANDOFF=0
if [[ "${1:-}" == "--handoff" ]]; then
  HANDOFF=1
  shift
fi
WHEN="${1:?usage: resume-at.sh [--handoff] <reset-time>}"
PROJECT_DIR="$(cd "$(dirname "$0")/../../../.." && pwd)"
BUFFER_SECONDS=120
MAX_RETRIES=6
RETRY_DELAY=600

if (( HANDOFF )); then
  RESUME_PROMPT='auto-continue resume (handoff): you are taking over checkpointed work in a fresh session. Read .claude/auto-continue/checkpoint.md — including its Context section — check out the branch it names, and continue from the first unfinished next step.'
else
  RESUME_PROMPT='auto-continue resume: the usage limit has reset. Read .claude/auto-continue/checkpoint.md and continue from the first unfinished next step.'
fi

log() { printf '%s %s\n' "$(date '+%Y-%m-%d %H:%M:%S')" "$*"; }

now=$(date +%s)
if [[ "$WHEN" == "now" ]]; then
  target=$(( now - BUFFER_SECONDS ))
elif [[ "$WHEN" =~ ^[0-9]+$ ]]; then
  target="$WHEN"
else
  target=$(date -d "$WHEN" +%s 2>/dev/null) || { log "cannot parse time: $WHEN"; exit 1; }
  # An HH:MM-style time that already passed today means tomorrow.
  if (( target <= now )); then
    target=$(( target + 86400 ))
  fi
fi
target=$(( target + BUFFER_SECONDS ))

wait_s=$(( target - now ))
if (( wait_s > 0 )); then
  log "sleeping ${wait_s}s until $(date -d "@$target" '+%Y-%m-%d %H:%M:%S')"
  sleep "$wait_s"
fi

cd "$PROJECT_DIR" || exit 1

claude_args=(--print --permission-mode acceptEdits)
if (( ! HANDOFF )); then
  claude_args=(--continue "${claude_args[@]}")
fi

for attempt in $(seq 1 "$MAX_RETRIES"); do
  log "resume attempt $attempt/$MAX_RETRIES (style: $([[ $HANDOFF == 1 ]] && echo handoff || echo continue))"
  output=$(claude "${claude_args[@]}" "$RESUME_PROMPT" 2>&1)
  status=$?
  printf '%s\n' "$output"
  # Match only the CLI/API limit-error signatures, not the word "limit" in
  # ordinary output (the resume prompt itself mentions the usage limit).
  if (( status == 0 )) && ! grep -qiE 'rate_limit_error|usage limit reached|reached your usage limit' <<<"$output"; then
    log "resume succeeded"
    exit 0
  fi
  log "still limited or failed (exit $status); retrying in ${RETRY_DELAY}s"
  sleep "$RETRY_DELAY"
done

log "gave up after $MAX_RETRIES attempts — run 'claude --continue' manually"
exit 1
