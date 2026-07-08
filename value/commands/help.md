---
name: value:help
description: Value framework — commands and workflow overview
allowed-tools:
  - Read
---
# Value Framework

**Know the destination. Detail the next step. Ship user value every iteration.**

## Commands

| Command | Purpose |
|---------|---------|
| `/value:start` | PRD via collaborative questioning |
| `/value:spec` | Technical spec from PRD |
| `/value:roadmap` | Phase + story titles (skeleton) |
| `/value:phase N` | Detail phase N before development |
| `/value:story` | Execute next story (Ralph loop) |
| `/value:revisit` | Revisit implementation approach |
| `/value:progress` | Where are we? What's next? |

## Workflow

```
/start → /spec → /roadmap → /phase 1 → /story (loop) → /revisit
                                              ↓
                                    /phase 2 → ...
```

## Principles

1. **User value first** — Story 1.1 is user-visible
2. **Atomic stories** — One goal, ~10 min, one PR, tests
3. **Rolling wave** — Titles upfront, detail just-in-time
4. **Revisit implementation** — HOW we build changes; WHAT we build stays stable
5. **Sacred history** — Merged work is never rewritten

## Artifacts

`.value/PRD.md` · `.value/SPEC.md` · `.value/ROADMAP.md` · `.value/STATE.md`

## Framework location

`/Users/davids/Development/Claude/skills/value/`
