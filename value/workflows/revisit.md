<purpose>
Revisit implementation method after a story or on demand. Update SPEC and approach for upcoming work. Product direction (PRD, roadmap titles) stays stable unless user confirms change.
</purpose>

<required_reading>
Read before starting:
- .value/STATE.md
- .value/STEERING.md
- .value/SPEC.md
- .value/ROADMAP.md
- .value/CHANGELOG.md
- references/implementation-revisit.md
</required_reading>

<process>

## 1. Orient

Read STATE.md — what was the last completed story?
Read STEERING.md — any active directives?
Read CHANGELOG — what shipped recently?

## 2. Extract decisions

From last story (or recent work if manual revisit):

Ask:
- What technical choices were made?
- What patterns emerged?
- What would we do differently?

Log in STATE.md Decisions section.

## 3. Update SPEC.md

Update **Implementation Notes** section:
- Patterns for upcoming stories
- Files/modules map
- Dependencies discovered
- Append to SPEC decision log

Do NOT change architecture scope without user confirmation.

## 4. Review upcoming stories

Look at next 2-3 pending stories in ROADMAP (titles + BRIEF descriptions).

Ask:
- Does our implementation approach still fit?
- Should the next story file (when created) use a different approach?
- Any blockers?

If story files exist for upcoming stories, update their Implementation Notes.

## 5. Blockers

If blocker found:
- Log in STATE.md Blockers
- Suggest fix or user decision
- Do not silently replan roadmap

## 6. Roadmap changes (rare)

Only with user confirmation:
- Add/remove/reorder story titles
- Rename phases
- Mark stories `dropped` with reason in CHANGELOG

## 7. Update STATE.md

Refresh Implementation Notes (current) section.
Set next action to `/value:story` unless blocked.

## 8. Report

Brief summary:
- Decisions logged
- SPEC changes (if any)
- Approach for next story
- Blockers (if any)

</process>

<success_criteria>
- [ ] STATE.md decisions updated if new decisions exist
- [ ] SPEC implementation notes reflect current approach
- [ ] Next story approach is clear
- [ ] No roadmap changes without user confirmation
</success_criteria>
