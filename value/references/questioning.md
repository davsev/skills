# PRD Questioning Guide

PRD creation is value discovery, not requirements gathering. Help the user articulate what they want to build and **who gets value from it**.

## Philosophy

**You are a thinking partner, not an interviewer.**

The user often has a fuzzy idea. Ask questions that make them think "oh, I hadn't considered that" or "yes, that's exactly what I mean."

Don't interrogate. Collaborate. Don't follow a script. Follow the thread.

**Filter every answer through user value:** Who benefits? What can they do after this exists that they couldn't before?

## The goal

By the end of questioning, write a PRD that downstream phases can act on:

- **Spec** needs: clear enough vision to define technical approach
- **Roadmap** needs: user capabilities to decompose into phases
- **Phase planning** needs: concrete stories within a phase
- **Story execution** needs: testable acceptance criteria

A vague PRD forces every downstream step to guess. The cost compounds.

## How to question

**Start open.** Let them dump their mental model. Don't interrupt with structure.

**Follow energy.** Whatever they emphasized, dig into that.

**Challenge vagueness.** "Good" means what? "Users" means who? "Simple" means how?

**Make the abstract concrete.** "Walk me through using this." "What does that actually look like?"

**Anchor on value.** "After this ships, what can the user do that they can't do today?"

**Know when to stop.** When you understand who it's for, what value they get, and what done looks like — offer to proceed.

## Forcing questions (gstack-inspired)

Use these when the conversation needs structure. Pick what's relevant — not a checklist.

### User & pain
- Who is the user? Be specific — not "everyone."
- What are they doing today without this? What's painful?
- What evidence do you have they want this?

### Value & wedge
- What is the **smallest thing** that delivers real user value?
- What's the narrowest version that tests the hypothesis?
- If we only ship one thing, what must it be?

### Success
- How will you know a user got value? (Observable behavior, not "code exists.")
- What does done look like from the user's perspective?
- What would make you kill this project?

### Scope
- What are we explicitly NOT building in v1?
- What assumption, if wrong, kills this approach?

### Alternatives
- What else could solve this? Why this approach?

## Using AskUserQuestion

Present concrete options to react to — interpretations, examples, priority choices.

**Good options:** Specific interpretations of what they might mean.

**Bad options:** Generic categories ("Technical", "Business", "Other").

Ask one question at a time. Wait for the answer. Follow up on interesting threads.

## Anti-patterns

- Don't accept "it should be intuitive" — ask what intuitive means with an example.
- Don't let story 1.1 be infrastructure ("set up DB", "scaffold project") unless explicitly labeled scaffold.
- Don't write the PRD before the user confirms the direction.
- Don't ask five questions in one message.

## Output

When questioning is complete, draft PRD.md from the template and present it for approval. Do not proceed to `/value:spec` until the user approves.
