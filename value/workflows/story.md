<purpose>
Execute the next pending story using a Ralph loop: fresh context, one story, test, implement, PR, revisit implementation. State lives on disk and in git — not in chat.
</purpose>

<required_reading>
Read before starting:
- .value/STATE.md (first — always)
- .value/STEERING.md
- .value/ROADMAP.md
- .value/SPEC.md
- Current phase BRIEF.md
- references/story-rules.md
- references/value-check.md
- references/implementation-revisit.md
- templates/story.md
</required_reading>

<process>

## 1. Orient

Read STATE.md → identify next story (first `pending` in current phase).

Read STEERING.md — apply any active directives.

If no pending story in current phase:
- If phase value check not run → run it, mark phase done
- Tell user: `Phase N complete. Run /value:phase N+1`
- Stop

## 2. Create story file (if missing)

Story files are created **only when the story is next up**:

```
.value/phases/phase-NN-<slug>/stories/NN-MM-<slug>.md
```

Fill from `templates/story.md`:
- User value, acceptance criteria, scope boundary, user-visible check
- Implementation notes from SPEC + BRIEF + STATE

Update story status to `in_progress` in file and ROADMAP.

## 3. RED — failing test

Write test(s) that assert acceptance criteria. Run test — confirm it fails.

If project has no test setup and story is `scaffold`, define verification command instead.

## 4. GREEN — minimal implementation

Implement minimum code to pass tests. No scope beyond story file.

## 5. Value check

For `type: value` stories: run user-visible check from story file.

Both tests and value check must pass.

## 6. Open PR

One story = one PR. Title: `Story X.Y: [title]`

PR description:
- User value delivered
- Acceptance criteria (checked off)
- User-visible check steps

Update story file: `pr: [link]`, `status: done`.

## 7. Update tracking

- ROADMAP: mark story `done`, update progress counts
- CHANGELOG: add entry (shipped, learned)
- STATE.md: last activity, position, next story

## 8. Revisit implementation

Run lightweight revisit per `references/implementation-revisit.md`:
- Log decisions in STATE.md
- Update SPEC.md implementation notes if approach changed
- Adjust next story file **only if already exists**

Suggest: `Run /value:revisit` for explicit pass, or continue if revisit was done inline.

## 9. Set next action

Update STATE.md:
```
Next action: Run /value:story (Story X.Y) — or /value:phase N+1 if phase complete
```

## 10. Exit

Do not start the next story in the same session unless user asks. Ralph loop = one story per iteration for fresh context.

</process>

<success_criteria>
- [ ] Tests pass
- [ ] Value check passes (if type: value)
- [ ] PR opened
- [ ] ROADMAP, CHANGELOG, STATE updated
- [ ] Implementation notes revisited
</success_criteria>
