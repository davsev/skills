# Value Check

Tests prove code works. A **value check** proves the user gets something.

## When required

Every story with `type: value` must pass a value check before the PR is opened.

`type: scaffold` stories use technical verification only (tests, lint, build).

## What it is

A value check is a concrete, repeatable observation that a user (or user-proxy) can experience the outcome:

- See a message on screen
- Click a button and reach a page
- Receive a response from an API
- Observe a state change in the UI

## Format

```markdown
## User-visible check
1. Open [URL or path]
2. Perform [action]
3. Confirm [observable outcome]
```

Keep it under 5 steps. If it takes longer, the story is too big.

## Relationship to tests

| Layer | Proves |
|-------|--------|
| Automated test | Code behaves as specified |
| User-visible check | A human would perceive the value |

For UI work, prefer Playwright or similar for the automated layer. The user-visible check can mirror the test steps in plain language for manual spot-checking.

## Phase-level value check

When a phase completes, verify the **phase goal** from ROADMAP:

> Phase 2: User can log in

Ask: Can a user actually log in end-to-end? Run the phase's critical path once.

## Anti-patterns

- "Tests pass" is not a value check
- "Code compiles" is not a value check
- "API returns 200" without checking response content is weak — specify what the response contains

## Failure handling

If the value check fails but tests pass:

1. The story is **not done**
2. Either the tests don't capture user value (fix tests), or the implementation doesn't deliver value (fix code)
3. Do not open the PR until both pass
