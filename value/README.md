# Value

Spec-driven development focused on **user value**.

## Quick start

```bash
# In your project
/value:start          # PRD via collaborative questioning
/value:spec           # Technical requirements
/value:roadmap        # Phase + story skeleton
/value:phase 1        # Detail phase 1 stories
/value:story          # Execute next story (Ralph loop)
/value:revisit        # Update implementation approach
/value:progress       # Where are we?
```

## Install commands

```bash
mkdir -p ~/.claude/commands/value
for f in commands/*.md; do
  ln -sfn "$(pwd)/$f" ~/.claude/commands/value/$(basename "$f")
done
```

Then run `./install.sh` from the skills repo root to link the skill itself.

## Philosophy

- **Product direction** is stable (PRD, phase titles).
- **Implementation method** is revisitable (SPEC, story approach, patterns).
- **Story detail** is just-in-time (created when the story is next up).

This avoids over-planning with LLMs while keeping a clear product horizon.
