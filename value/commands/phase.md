---
name: value:phase
description: Flesh out a phase before development — BRIEF, story validation, implementation approach
argument-hint: "[phase-number]"
allowed-tools:
  - Read
  - Write
  - Bash
  - Glob
  - Grep
  - AskQuestion
---
<objective>
Create phase BRIEF and validate stories just before building. Reads git history and prior work. Rolling-wave detail.

**Creates:**
- `.value/phases/phase-NN-<slug>/BRIEF.md`

**After this command:** Run `/value:story`.
</objective>

<execution_context>
@/Users/davids/Development/Claude/skills/value/workflows/phase.md
@/Users/davids/Development/Claude/skills/value/templates/phase-brief.md
@/Users/davids/Development/Claude/skills/value/references/story-rules.md
@/Users/davids/Development/Claude/skills/value/references/implementation-revisit.md
</execution_context>

<context>
Phase number: $ARGUMENTS (optional — auto-detects next unstarted phase if omitted)
</context>

<process>
Execute the phase workflow from @/Users/davids/Development/Claude/skills/value/workflows/phase.md end-to-end.
Read existing work before planning. Revisit implementation approach.
</process>
