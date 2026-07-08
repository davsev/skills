---
name: value:story
description: Execute next story — Ralph loop (test, implement, PR, revisit implementation)
allowed-tools:
  - Read
  - Write
  - Bash
  - Glob
  - Grep
  - Shell
---
<objective>
Execute the next pending user story:
1. Create story file if next up
2. RED — failing test
3. GREEN — minimal implementation
4. Value check
5. Open PR (one story = one PR)
6. Update tracking
7. Revisit implementation approach

One story per iteration. Fresh context next time.
</objective>

<execution_context>
@/Users/davids/Development/Claude/skills/value/workflows/story.md
@/Users/davids/Development/Claude/skills/value/templates/story.md
@/Users/davids/Development/Claude/skills/value/references/story-rules.md
@/Users/davids/Development/Claude/skills/value/references/value-check.md
@/Users/davids/Development/Claude/skills/value/references/implementation-revisit.md
</execution_context>

<process>
Execute the story workflow from @/Users/davids/Development/Claude/skills/value/workflows/story.md end-to-end.
Read STATE.md and STEERING.md first. One story only unless user requests continue.
</process>
