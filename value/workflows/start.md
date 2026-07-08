<purpose>
Initialize a new Value project through collaborative PRD questioning. This is the most leveraged moment — clarity here means better specs, better stories, better outcomes.
</purpose>

<required_reading>
Read before starting:
- references/questioning.md
- templates/PRD.md
- templates/STATE.md
- templates/config.json
- templates/STEERING.md
- templates/CHANGELOG.md
</required_reading>

<process>

## 1. Setup check

```bash
# Check if already initialized
test -d .value && echo "EXISTS" || echo "NEW"
```

**If `.value/` exists:** Stop. Tell user to run `/value:progress` or continue from current state. Do not re-initialize without explicit user request to reset.

**If new:** Create `.value/` directory.

## 2. Gather initial input

Ask the user to describe what they want to build. Accept:
- Freeform description in the prompt
- `@file` reference to an existing doc

Do not write files yet. Start questioning.

## 3. PRD questioning

Follow `references/questioning.md`:

- One question at a time (use AskUserQuestion when helpful)
- Filter through user value
- Use forcing questions when conversation stalls
- Challenge vagueness
- Stop when you have: who, what value, v1 scope, success criteria

**Gate:** User must confirm direction before drafting PRD.

## 4. Write artifacts

Create from templates:

| File | Source template |
|------|-----------------|
| `.value/PRD.md` | templates/PRD.md |
| `.value/STATE.md` | templates/STATE.md |
| `.value/STEERING.md` | templates/STEERING.md |
| `.value/CHANGELOG.md` | templates/CHANGELOG.md |
| `.value/config.json` | templates/config.json |

Fill `config.json` with project name and `created_at` (ISO date).

Set PRD status to `draft`.

## 5. Present PRD for approval

Show the PRD summary:
- Core value (one line)
- Users
- v1 scope (in/out)
- Value stories
- Success criteria

Ask: "Approve this PRD to proceed to `/value:spec`?"

## 6. On approval

- Set PRD status to `approved`
- Update STATE.md:
  - Status: `ready for spec`
  - Next action: `Run /value:spec`

## 7. Commit (if git repo and user wants planning committed)

If `.value/` should be tracked, offer to commit:

```
git add .value/
git commit -m "value: initialize PRD"
```

Only commit if user confirms or project convention tracks planning docs.

</process>

<success_criteria>
- [ ] `.value/PRD.md` exists with approved status
- [ ] `.value/STATE.md` points to `/value:spec` as next action
- [ ] Story 1.1 in PRD value stories is user-visible (not pure infrastructure)
</success_criteria>
