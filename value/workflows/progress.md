<purpose>
Show current project position, progress, and next action. Entry point for resuming work.
</purpose>

<required_reading>
Read:
- .value/STATE.md
- .value/ROADMAP.md
- .value/STEERING.md (active directives only)
</required_reading>

<process>

## 1. Check initialization

If `.value/` does not exist:
- Tell user: "No Value project. Run `/value:start`"
- Stop

## 2. Read state

Load STATE.md, ROADMAP.md, STEERING.md.

## 3. Present status

Show user:

### Position
- Core value (from PRD one-liner)
- Phase X of Y — name
- Current story (or "phase complete")
- Status

### Progress
- Progress bar from ROADMAP counts
- Stories done / total
- Recent CHANGELOG entries (last 3 if exists)

### Steering
- Active directives from STEERING.md (if any)

### Artifacts
| File | Status |
|------|--------|
| PRD | draft/approved |
| SPEC | draft/approved/missing |
| ROADMAP | exists/missing |

### Next action
From STATE.md — the exact command to run.

## 4. Offer actions

Based on state, suggest one command:
- No PRD → `/value:start`
- PRD draft → approve, then `/value:spec`
- No spec → `/value:spec`
- No roadmap → `/value:roadmap`
- Phase not briefed → `/value:phase N`
- Stories pending → `/value:story`
- Just finished story → `/value:revisit` (optional) then `/value:story`

</process>
