---
name: behavioral
description: Turn the user's real experiences into a bank of STAR interview stories and practice delivering them. Also covers "tell me about yourself" and "why this company".
argument-hint: "[build | practice | pitch]"
---

# /coach:behavioral

Arguments: `$ARGUMENTS`

Bank: `~/.claude/coach/stories.md`. Use only facts the user gives you, their resume (`~/.claude/coach/resume.md`) and their journals. Never invent details, numbers or outcomes; ask when something is missing.

## build
1. Mine candidates from the resume, `.learning/journal.md` and the project's vibe-debt. Good stories have a hard problem, a number, or a failure that was fixed.
2. For each, interview the user briefly and write a story with: **Situation** (one line), **Task**, **Action** (what *I* did, specifically), **Result** (with a number), **Lesson**, and tags.
3. Tag each against: ownership, failure or mistake, conflict or disagreement, ambiguity, deadline or pressure, learning something fast, leadership or influence, technical depth.
4. Aim for 6 to 8 stories covering all tags, then report which tags are still uncovered and what to look for.

## practice
1. Ask a behavioral question (say the tag); the user answers aloud in text as they would speak.
2. Feedback: length (target 90 seconds, about 200 words), "I" versus "we", a specific result, a lesson, no rambling setup. Say what to cut. Then ask a probing follow-up as an interviewer would.
3. Have them redo it tighter. Update the story in the bank with the improved version.

## pitch
Write a 60 second "tell me about yourself" with the user: present (current role and strongest work), past (how you got here), future (what you want next, tailored to the role). Then draft a "why this company" outline with blanks for them to research and fill, and do not make up facts about the company.

## Activity log
As the final step, append one line to `~/.claude/coach/activity.md` (create it if missing): `YYYY-MM-DD | behavioral | <build|practice|pitch> | <stories in bank, or tag practiced>`. This feeds `/coach:week`.
