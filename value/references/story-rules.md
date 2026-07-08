# Story Rules

Every unit of work in Value is a **user story**. These rules are non-negotiable.

## One goal

A story completes **one** goal. If the title contains "and", "&", or lists multiple outcomes — split it.

| Bad | Good |
|-----|------|
| Add login form and validation | Story A: User sees login form. Story B: User sees error on invalid input. |
| Refactor auth and add tests | Story A: Refactor auth module. Story B: User can log in (with tests). |

Prefer user-visible outcomes over technical tasks.

## ~10 minutes

A story should be completable in ~10 minutes of focused agent work:

- One user-visible behavior change, OR
- One focused technical change with a clear verification step

**Safety valve:** If a story would touch more than 3 files, split it.

10 minutes is agent time, not wall clock (tests, PR, review add overhead). The constraint is **scope**, not a stopwatch.

## One PR

Each story = one pull request. PR title matches the story title.

Benefits: traceable history, easy rollback, reviewable units.

## Tests required

Every story includes tests that prove the acceptance criteria:

- Prefer tests that assert **user-visible behavior**
- Unit tests alone are insufficient if the story is user-facing — include an integration or E2E check when practical
- RED → GREEN → commit

## Story types

| Type | When | Limit |
|------|------|-------|
| `value` | User-visible outcome | Default — most stories |
| `scaffold` | Necessary setup with no user-visible change | Max 1 per phase |

Scaffold stories must justify why value can't come first. If you need two scaffolds, the phase is scoped wrong.

## Story file lifecycle

1. **ROADMAP.md** lists story **titles only**
2. **Phase brief** (`BRIEF.md`) expands titles into one-line descriptions
3. **Story file** is created only when the story is **next up** (full acceptance criteria, scope boundary, files)
4. After completion: checkbox in ROADMAP, entry in CHANGELOG, decision notes in STATE

## Acceptance criteria format

Every criterion must be testable. Use checkbox format:

```markdown
## Acceptance (testable)
- [ ] Wrong password → "Invalid email or password" visible on screen
- [ ] Correct password → user lands on /dashboard
```

No vague criteria: "works correctly", "is fast", "looks good".

## Scope boundary

Every story file includes what is **NOT** in scope:

```markdown
## Scope boundary (NOT in this story)
- NOT: rate limiting
- NOT: forgot password link
```

This prevents scope creep in a 10-minute window.

## User-visible check

For `type: value` stories, include a manual verification step a human can run in 30 seconds:

```markdown
## User-visible check
Open /login, enter bad password, confirm error text appears.
```
