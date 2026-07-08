#!/usr/bin/env bash
# Symlink Value slash commands into ~/.claude/commands/value/
set -euo pipefail
repo="$(cd "$(dirname "$0")" && pwd)"
mkdir -p "$HOME/.claude/commands/value"
for f in "$repo/commands"/*.md; do
  name="$(basename "$f")"
  ln -sfn "$f" "$HOME/.claude/commands/value/$name"
  echo "linked: ~/.claude/commands/value/$name -> $f"
done
echo "Done. Run /value:help to verify."
