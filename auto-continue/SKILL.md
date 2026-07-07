---
name: auto-continue
description: >
  Survive the 5-hour usage limit without losing work. Invoke when a usage/rate
  limit is hit or about to be hit (messages like "5-hour limit reached",
  "You've reached your usage limit", a 429 rate_limit_error, or the user says
  "I hit the limit" / "continue after the limit resets"). Identifies when the
  limit window refreshes, checkpoints the current task, schedules an automatic
  resume at reset time, and on resume continues from where the work left off.
  Also supports a handoff option ("handoff", "fresh session", "clean context",
  "clear the conversation") that continues the work in a new session with a
  clean context instead of resuming the old conversation.
---

# Auto-continue after the 5-hour usage limit

When the 5-hour usage limit is reached, the model cannot respond until the
window resets — so everything needed to continue must be prepared *before*
the session goes dark, and the resume must be triggered by something
*external* to the model (a scheduled script or a scheduled wake-up).

This skill has two modes. Detect which one applies and follow it:

- **ARM mode** — the limit was just hit (or is imminent). Checkpoint the work
  and schedule the resume.
- **RESUME mode** — the session was just woken by a scheduled resume (the
  prompt mentions "auto-continue resume" or a checkpoint file exists at
  `.claude/auto-continue/checkpoint.md` with `status: armed`). Pick the work
  back up.

ARM mode additionally has two **resume styles**:

- **continue** (default) — resume the *same* conversation
  (`claude --continue`). Full history is preserved, but so is its size:
  a near-limit conversation is usually near-full context, which burns
  tokens faster and can degrade quality.
- **handoff** — continue the work in a *fresh* session with a clean
  context. The checkpoint becomes the only bridge, so it must be written
  self-contained (see Step 2). Choose handoff when the user asks for it
  ("handoff", "clean context", "start fresh"), or recommend it yourself
  when the conversation is very long or mostly exhausted exploration —
  and say which style you picked and why.

The user may also invoke handoff *without* a limit event ("hand off to a
fresh session", "clean the context and continue") — in that case run ARM
mode with `resume_at` = now: checkpoint, then hand off immediately.

---

## ARM mode

### Step 1 — Identify when the limit resets

Try these sources, in order, and stop at the first one that gives a time:

1. **The limit message itself.** Claude Code's banner and API errors usually
   state the reset time, e.g. `5-hour limit reached ∙ resets 3pm`,
   `Your limit will reset at 16:00`, or a 429 response with a
   `retry-after: <seconds>` header or an `error.message` containing a reset
   timestamp. Parse that.
2. **The start of the current window.** The 5-hour window opens at the first
   message of the current usage block. If the session start time is known
   (e.g. from the first timestamp in the conversation, or
   `ls -l ~/.claude/projects/<project>/` session file mtimes), reset time =
   window start + 5 hours, rounded up to the next full hour.
3. **Ask the user** if they are still reachable — the banner on their screen
   shows the exact reset time.
4. **Fallback:** assume now + 5 hours. A resume that fires while still
   rate-limited is harmless — the script retries (see below).

Convert the result to epoch seconds (`date -d '3pm' +%s`, adding a day if the
time already passed) and tell the user the reset time you determined.

### Step 2 — Write a checkpoint

Write `.claude/auto-continue/checkpoint.md` (create the directory if needed):

```markdown
---
status: armed
armed_at: <ISO-8601 now>
resume_at: <ISO-8601 reset time, or "now" for an immediate handoff>
style: continue | handoff
branch: <current git branch>
---

# Task
<one-paragraph statement of the overall task, in your own words>

# Done so far
- <completed step, with file paths>

# Next steps (in order)
1. <the very next concrete action — be specific enough that a fresh
   session could execute it without re-deriving context>
2. ...

# State
- Files modified but not committed: <list, or "none">
- Last command run and its result: <...>
- How to verify when finished: <test/lint/build command>

# Context (required for handoff, optional for continue)
<Everything a session with ZERO conversation history needs and cannot
cheaply re-derive: the user's original request in their words, key
decisions made and why, approaches already tried and rejected, gotchas
discovered, and a short map of the relevant files. Write it like a
handoff note to a competent colleague — after a handoff this file is the
only memory that survives.>
```

Then protect the in-flight work: if there are uncommitted changes, commit
them as WIP on the current branch (`git add -A && git commit -m "wip:
checkpoint before usage-limit pause"`). Push if a remote branch is already
set up. Never leave work only in the working tree — the resume may happen in
a fresh process.

### Step 3 — Schedule the resume

Pick whichever mechanism this environment supports, in this order:

1. **Remote / web session with scheduling tools** (`send_later`,
   `ScheduleWakeup`, or `create_trigger` from the claude-code-remote MCP
   server):
   - *continue style*: schedule a one-shot message into **this session** at
     the reset time (add a 2-minute buffer) with the text:
     `auto-continue resume: the usage limit has reset. Read
     .claude/auto-continue/checkpoint.md and continue from the first
     unfinished next step.`
   - *handoff style*: use `create_trigger` with
     `create_new_session_on_fire: true` (fresh session, clean context) and a
     **standalone** prompt — the new session knows nothing, so spell it out:
     `You are taking over checkpointed work in <repo>. Check out branch
     <branch>, read .claude/auto-continue/checkpoint.md, and continue from
     the first unfinished next step.` For an immediate handoff, fire the
     trigger right away (or set `run_once_at` one minute out).
2. **Local CLI session**: launch the bundled resume script, detached, so it
   survives this session ending:

   ```bash
   # continue style — resumes this conversation
   nohup bash .claude/skills/auto-continue/scripts/resume-at.sh <reset-epoch> \
     >> .claude/auto-continue/resume.log 2>&1 &

   # handoff style — starts a fresh session with a clean context
   nohup bash .claude/skills/auto-continue/scripts/resume-at.sh --handoff <reset-epoch> \
     >> .claude/auto-continue/resume.log 2>&1 &
   ```

   The script sleeps until the reset time (`now` skips the wait, for an
   immediate handoff), then relaunches Claude Code in this project — with
   `--continue` in continue style, or as a brand-new session in handoff
   style. If the limit turns out not to be lifted yet, it backs off 10
   minutes and retries (up to 6 times).
3. **Neither available**: tell the user the exact reset time and the one
   command to run after it — `claude --continue` (continue) or plain
   `claude` (handoff) — the checkpoint file does the rest, because RESUME
   mode below triggers on it.

Finally, confirm to the user in one line: what was checkpointed, when the
resume fires, and by which mechanism.

## RESUME mode

1. Read `.claude/auto-continue/checkpoint.md`. If `status` is not `armed`,
   say so and stop — there is nothing to resume.
2. Verify you are on the branch named in the checkpoint (`git checkout` it if
   not) and that the WIP commit is present.
3. Set `status: resumed` in the checkpoint frontmatter (keep the file for
   audit).
4. Continue the work: execute the "Next steps" in order, using "Done so far"
   and "State" to avoid redoing anything. Do not re-plan from scratch —
   the checkpoint is the plan. In a handoff (fresh session) also read the
   "Context" section first and trust it over re-exploring: it exists
   precisely so the clean session doesn't re-spend context rediscovering
   what the old one already knew.
5. If the limit is *still* active (requests fail with rate_limit errors),
   re-enter ARM mode with the new reset time.

## Notes

- A headless resume (`claude -c -p ...`) cannot answer permission prompts.
  The resume script passes `--permission-mode acceptEdits` so file edits
  proceed; anything needing broader permission will be left as a clearly
  described next step in the checkpoint for the user's next interactive
  session.
- If several sessions are active in the same project, arm only the one whose
  work matters — checkpoints are per-project, and the last writer wins.
- Handoff is deliberately lossy: only what's written in the checkpoint
  survives. If the conversation contains unresolved user decisions or
  subtle nuance that can't be captured in a page of notes, prefer continue
  style and say so.
