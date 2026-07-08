# Implementation Revisit

Value separates **product direction** (stable) from **implementation method** (revisitable).

After each story, revisit **how** we build — not necessarily **what** we build.

## What to revisit (after every story)

Run a lightweight pass. Takes 1-2 minutes. Update only if something changed.

### 1. Technical decisions

Did this story force a choice? Log it:

- Library or pattern chosen
- API shape decided
- File structure established
- Approach rejected and why

→ Append to `STATE.md` Decisions and update `SPEC.md` if the decision affects future work.

### 2. Implementation approach for upcoming stories

Look at the next 2-3 story titles in ROADMAP. Ask:

- Does our new code change how we should implement them?
- Did we discover a better pattern?
- Are there new dependencies or constraints?

→ Update `SPEC.md` Implementation Notes section. Adjust upcoming story files **only if already created**.

### 3. Story file adjustments (if needed)

If a completed story reveals the **next story's approach** should differ:

- Update the next story file's "Files likely touched" and implementation notes
- Do NOT rename or remove roadmap titles without user confirmation

## What NOT to revisit (after every story)

- **PRD** — only update when product decisions change (user feedback, scope pivot)
- **ROADMAP phase titles** — stable unless a decision invalidates a future phase
- **Completed stories** — sacred; never rewrite merged work

## When to do a deeper revisit

| Trigger | Action |
|---------|--------|
| Every story | Lightweight: decisions + next-story approach (`/value:revisit`) |
| Phase complete | Full: `/value:phase N+1` reads all merged work, may adjust future phase titles |
| User feedback | Update PRD, then `/value:revisit` with scope check |
| STEERING.md changed | Re-read priorities before next `/value:story` |
| Blocker discovered | Log in STATE.md, revisit approach for blocked stories |

## STEERING.md

Mid-flight priority changes without stopping the loop:

```markdown
# Steering

## Priority change (2026-07-08)
Skip password reset (Phase 3). Do profile edit first.
Reason: user interview feedback.
```

Read `STEERING.md` at the start of every `/value:story` and `/value:revisit`.

## Decision log format

In STATE.md:

```markdown
## Decisions
- 2026-07-08 (Story 2.2): Use session cookies, not JWT — simpler for MVP, fewer deps
- 2026-07-08 (Story 2.3): Error messages via i18n keys, not hardcoded strings
```

In SPEC.md, maintain an Implementation Notes section that reflects current approach for upcoming work.

## Revisit vs replan

| Revisit (default) | Replan (rare, user-confirmed) |
|-------------------|-------------------------------|
| Update SPEC implementation notes | Change PRD scope |
| Adjust next story's approach | Rename/drop future phases |
| Log decisions | Reorder roadmap titles |
| Note blockers | Invalidate completed work (never without explicit user approval) |

When in doubt, revisit implementation — don't replan the product.
