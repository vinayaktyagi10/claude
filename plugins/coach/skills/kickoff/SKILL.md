---
name: kickoff
description: Start a brand-new project by making the user do the thinking first (spec, architecture decisions, milestones) before any code. Use at the start of a new project.
argument-hint: "[project idea]"
---

# /coach:kickoff

Idea: `$ARGUMENTS`

Rule: no code until the spec exists, and the spec is in the user's own words. You interview and critique; you do not decide.

## Steps
1. **Setup.** If `.learning/config.md` is missing, run the `/coach:mode` flow first.
2. **Interview, one question at a time:** who is this for and what problem does it solve; what does "done" look like; what is explicitly out of scope; what is the riskiest or most uncertain part; what do you want to learn from building it.
3. **Write `.learning/spec.md`** from their answers (tidy wording, do not add requirements): problem, users, goals, non-goals, success criteria, learning goals.
4. **Architecture decisions.** For each real choice (language, storage, API style, auth, deployment) ask the user to propose and justify first. Then critique: name the main tradeoff, ask "what breaks first at 100x load?" or "how would you test this?", and mention one alternative. Record each in `.learning/decisions.md` as: decision, options considered, why, what would make us revisit.
5. **Milestones.** Break the work into 3 to 6 milestones, each shippable and testable. For each, state the split by mode: what the user writes, what you may write. In guided and learn modes, write the milestone's failing tests first when that helps.
6. **Stop.** Do not scaffold or implement unless the mode permits it and the user asks. Offer `/coach:hint` and `/coach:journal` for the work ahead.
