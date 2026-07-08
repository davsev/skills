<purpose>
Create phase structure and story titles only. Know where we're heading without false precision on unstarted work.
</purpose>

<required_reading>
Read before starting:
- .value/PRD.md
- .value/SPEC.md (must be approved)
- .value/STATE.md
- templates/ROADMAP.md
- references/story-rules.md
</required_reading>

<process>

## 1. Preconditions

- PRD approved
- SPEC approved
- If `.value/ROADMAP.md` exists: ask user to confirm overwrite or extend

## 2. Decompose into phases

**Phases = user capabilities**, not technical milestones.

Rules:
- Phase 1 delivers first user value from PRD (fastest path to "user can see/do X")
- Each phase has a clear goal: "When done, user can ___"
- Later phases can be `NOT PLANNED` with intent only — story titles TBD
- Max 1 `scaffold` story per phase (see story-rules.md)

## 3. Decompose phases into story titles

For each phase being planned now (typically Phase 1 fully, Phase 2+ titles only):

Story title rules:
- One goal — no "and"
- User-visible language where possible
- ~10 min scope (at title level — if title sounds big, split)
- Numbered: 1.1, 1.2, etc.

**Do NOT create story files yet.** Titles in ROADMAP only.

## 4. Write ROADMAP.md

Create `.value/ROADMAP.md` from template:
- Phase goals
- Story title tables with `pending` status
- Progress counts

## 5. Present for approval

Show:
- Phase list with goals
- Phase 1 story titles (full)
- Later phases (titles or TBD)

Ask: "Approve roadmap? Next: `/value:phase 1` to detail Phase 1 stories."

## 6. On approval

Update STATE.md:
- Phase: 1 of N
- Status: `ready for phase planning`
- Next action: `Run /value:phase 1`

</process>

<success_criteria>
- [ ] `.value/ROADMAP.md` exists
- [ ] Phase 1 story 1.1 is type `value` (user-visible)
- [ ] No story titles contain "and" or multiple goals
- [ ] STATE.md next action is `/value:phase 1`
</success_criteria>
