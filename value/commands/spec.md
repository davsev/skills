---
name: value:spec
description: Create technical specification from approved PRD
allowed-tools:
  - Read
  - Write
  - Bash
  - Glob
  - Grep
  - AskQuestion
---
<objective>
Write `.value/SPEC.md` — technical requirements grounded in approved PRD and existing codebase.

**After this command:** Approve spec, then run `/value:roadmap`.
</objective>

<execution_context>
@/Users/davids/Development/Claude/skills/value/workflows/spec.md
@/Users/davids/Development/Claude/skills/value/templates/SPEC.md
@/Users/davids/Development/Claude/skills/value/references/implementation-revisit.md
</execution_context>

<process>
Execute the spec workflow from @/Users/davids/Development/Claude/skills/value/workflows/spec.md end-to-end.
Requires approved PRD. Preserve approval gate.
</process>
