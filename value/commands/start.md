---
name: value:start
description: Initialize Value project — PRD creation through collaborative questioning
argument-hint: "[@idea-doc]"
allowed-tools:
  - Read
  - Write
  - Bash
  - Glob
  - Grep
  - AskQuestion
---
<objective>
Initialize a new Value project through gstack-style questioning → approved PRD.

**Creates:**
- `.value/PRD.md` — product requirements (user value focused)
- `.value/STATE.md` — project position and next action
- `.value/STEERING.md` — mid-flight priority changes
- `.value/CHANGELOG.md` — shipped work log
- `.value/config.json` — workflow preferences

**After this command:** Approve PRD, then run `/value:spec`.
</objective>

<execution_context>
@/Users/davids/Development/Claude/skills/value/workflows/start.md
@/Users/davids/Development/Claude/skills/value/references/questioning.md
@/Users/davids/Development/Claude/skills/value/templates/PRD.md
@/Users/davids/Development/Claude/skills/value/templates/STATE.md
@/Users/davids/Development/Claude/skills/value/templates/STEERING.md
@/Users/davids/Development/Claude/skills/value/templates/CHANGELOG.md
@/Users/davids/Development/Claude/skills/value/templates/config.json
</execution_context>

<process>
Execute the start workflow from @/Users/davids/Development/Claude/skills/value/workflows/start.md end-to-end.
Preserve all gates (questioning, PRD approval, STATE update).
</process>
