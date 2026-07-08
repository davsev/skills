<purpose>
Flesh out a phase just before development. Read existing work, create BRIEF.md, validate story breakdown. Rolling-wave planning — detail when ready to build.
</purpose>

<required_reading>
Read before starting:
- .value/PRD.md
- .value/SPEC.md
- .value/ROADMAP.md
- .value/STATE.md
- .value/CHANGELOG.md (if exists)
- templates/phase-brief.md
- references/story-rules.md
- references/implementation-revisit.md
</required_reading>

<process>

## 1. Identify phase

Phase number from `$ARGUMENTS`. If omitted, pick first phase in ROADMAP not marked done.

Validate phase exists in ROADMAP.

## 2. Read existing work

Before planning, ground in reality:

```bash
git log --oneline -20
git branch --show-current
```

Read:
- STATE.md decisions and implementation notes
- CHANGELOG for prior shipped stories
- SPEC implementation notes
- Prior phase BRIEF.md if phase > 1

For phase N > 1: summarize what codebase contains from phases 1..N-1.

## 3. Revisit implementation approach

Per `implementation-revisit.md`:
- Does prior work change how we should build this phase?
- Update SPEC.md Implementation Notes if needed
- Note in phase BRIEF

**Do not change ROADMAP phase titles** without user confirmation.

## 4. Validate / adjust story titles

For this phase's stories in ROADMAP:
- Split any title that violates story-rules (compound goals)
- Add stories if gaps discovered
- Drop stories only with user confirmation (mark `dropped` in ROADMAP, note in CHANGELOG)

## 5. Create phase directory

```
.value/phases/phase-NN-<slug>/
  BRIEF.md
  stories/          # empty — story files created by /value:story when next up
```

Write BRIEF.md from template:
- Context from prior work
- Story table with one-line descriptions
- Phase value check
- Implementation approach for this phase

## 6. Present for approval

Show BRIEF summary and story list. Ask to proceed to `/value:story`.

## 7. On approval

Update STATE.md:
- Phase: N
- Story: first pending in phase
- Status: `ready for story execution`
- Next action: `Run /value:story`

Update ROADMAP if story titles changed.

</process>

<success_criteria>
- [ ] `.value/phases/phase-NN-*/BRIEF.md` exists
- [ ] All phase stories have one-line descriptions
- [ ] Phase value check defined
- [ ] STATE.md next action is `/value:story`
</success_criteria>
