<purpose>
Create technical specification from approved PRD. Defines HOW we build — revisitable during development, stable at approval.
</purpose>

<required_reading>
Read before starting:
- .value/PRD.md (must be approved)
- .value/STATE.md
- templates/SPEC.md
- references/implementation-revisit.md
</required_reading>

<process>

## 1. Preconditions

Read `.value/PRD.md`. If status is not `approved`:
- Stop. Tell user to run `/value:start` and approve PRD first.

Read `.value/STATE.md` for context.

## 2. Codebase scan (brownfield)

If project has existing code:
- Scan structure (Glob, Read key files)
- Note stack, patterns, test setup
- Ground SPEC in what exists — don't propose rewrites

If greenfield:
- Propose stack based on PRD and user context
- Ask 1-2 clarifying questions if stack is ambiguous

## 3. Draft SPEC

Create `.value/SPEC.md` from `templates/SPEC.md`:

- Map each PRD value story to technical approach
- Define architecture, interfaces, data model (v1 only)
- Testing strategy aligned with project
- Implementation notes for phase 1

**YAGNI:** Only spec what's needed for v1 PRD scope.

## 4. Present for approval

Show summary:
- Stack choices
- Architecture (brief)
- Key interfaces
- Testing approach
- Open technical risks

Ask: "Approve this spec to proceed to `/value:roadmap`?"

## 5. On approval

- Set SPEC status to `approved`
- Update STATE.md:
  - Status: `ready for roadmap`
  - Next action: `Run /value:roadmap`

</process>

<success_criteria>
- [ ] `.value/SPEC.md` exists, approved
- [ ] Every PRD value story has a technical path in SPEC
- [ ] STATE.md next action is `/value:roadmap`
</success_criteria>
