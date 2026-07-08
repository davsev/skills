#!/usr/bin/env bash
# Symlink every skill in this repo into ~/.claude/skills so Claude Code loads it.
# Safe to rerun after adding skills or cloning on a new machine.
set -euo pipefail
repo="$(cd "$(dirname "$0")" && pwd)"
mkdir -p "$HOME/.claude/skills"
for d in "$repo"/*/; do
  name="$(basename "$d")"
  [[ -f "$d/SKILL.md" ]] || continue
  ln -sfn "${d%/}" "$HOME/.claude/skills/$name"
  echo "linked: ~/.claude/skills/$name -> ${d%/}"
done
