---
name: value
description: >
  Spec-driven development focused on user value. Use when starting a new feature
  or project, writing a PRD, creating technical specs, breaking work into phases
  and atomic user stories, or executing one-story-per-PR Ralph loops. Commands:
  /value:start, /value:spec, /value:roadmap, /value:phase, /value:story,
  /value:revisit, /value:progress.
---

# Value

**Know the destination. Detail the next step. Ship user value every iteration.**

Value is a spec-driven development framework where **user value** is the north star — not context engineering, not ceremony. It combines gstack-style PRD questioning, rolling-wave phase planning, atomic user stories (~10 min, one PR, tests), and a Ralph loop per story.

## Install

```bash
# Link skill (from skills repo root)
./install.sh

# Link slash commands
mkdir -p ~/.claude/commands/value
for f in /Users/davids/Development/Claude/skills/value/commands/*.md; do
  ln -sfn "$f" ~/.claude/commands/value/$(basename "$f")
done
```

## Commands

| Command | Purpose |
|---------|---------|
| `/value:start` | Create PRD through collaborative questioning |
| `/value:spec` | Write technical spec from approved PRD |
| `/value:roadmap` | Create phase + story titles (skeleton only) |
| `/value:phase N` | Flesh out stories for phase N before development |
| `/value:story` | Execute next story: test → implement → PR |
| `/value:revisit` | Revisit implementation approach; update SPEC from decisions |
| `/value:progress` | Show current position and next action |

## Project artifacts

Running `/value:start` creates `.value/` in the project:

```
.value/
  PRD.md           # What & why (living document)
  SPEC.md          # How (living document)
  ROADMAP.md       # Phase + story titles (skeleton)
  STATE.md         # Position, decisions, next action
  STEERING.md      # Mid-flight priority changes
  CHANGELOG.md     # What shipped
  config.json      # Workflow preferences
  phases/
    phase-01-<slug>/
      BRIEF.md
      stories/
        01-02-<slug>.md
```

## Core principles

1. **User value first** — Every phase delivers something a user can see or do. Story 1.1 is never "set up database."
2. **Atomic stories** — One goal per story. No "and". ~10 minutes. One PR. Tests required.
3. **Rolling wave** — ROADMAP has titles; detailed story files created just before execution.
4. **Revisit implementation** — After each story, update how we build (SPEC, patterns, approach). Roadmap titles stay stable unless a decision forces change.
5. **Sacred history** — Merged work is never rewritten. Future stories can be added, reordered, or dropped.

## Workflow

```
/value:start → /value:spec → /value:roadmap
                                    ↓
              /value:phase 1 → /value:story (loop) → /value:revisit
                                    ↓
              /value:phase 2 → ...
```

## File locations

- Workflows: `workflows/`
- Templates: `templates/`
- References: `references/`
- Commands: `commands/`
