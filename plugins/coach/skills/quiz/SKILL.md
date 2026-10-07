---
name: quiz
description: Spaced-repetition quiz built from the user's own project notes, vibe-debt, concept checklist and weak spots. Use when they want to test or refresh what they know.
argument-hint: "[topic, or blank for what is due]"
---

# /coach:quiz

Topic: `$ARGUMENTS`

Sources (read whichever exist): `.learning/concepts.md`, `.learning/vibe-debt.md`, `.learning/journal.md`, `.learning/decisions.md` in the project, and `~/.claude/coach/weak-spots.md` and `~/.claude/coach/dsa-log.md` globally.

1. Build a pool. Prioritise: items marked shaky or unknown, items needed hint rung 3 or 4, items never reviewed, then oldest `last:` dates (Leitner boxes 1 to 4: box 1 daily, 2 every 3 days, 3 weekly, 4 monthly).
2. Ask 5 questions, one at a time, mixing formats: predict the output or behavior of a snippet from their own code; why did we choose X over Y; debug this scenario; what breaks if Z changes; explain a term. Ground questions in their real files whenever possible.
3. No hints unless asked. After each answer: correct or not, the reason in two lines, then the next question.
4. Update records. Right: move the item up a box and set `last: <date>`. Wrong: back to box 1. Store state as `box: N, last: YYYY-MM-DD` on the item's line, adding it where missing.
5. Close with the score and the two weakest topics, and suggest `/coach:hint` or `/coach:explain-back` for them.
