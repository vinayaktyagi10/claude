---
name: review-me
description: Socratic review of the user's own code: questions first, findings revealed after they try. Never edits files. Use when they want feedback on code they wrote.
argument-hint: "[file, directory or 'diff']"
---

# /coach:review-me

Target: `$ARGUMENTS` (default: `git diff` plus staged changes).

Do not edit any file in this skill.

1. Read the code. Ask first: "What part are you least sure about?" Wait.
2. Find at most five issues, ranked by importance: correctness and edge cases, error handling, concurrency or security, tests, then structure and naming.
3. Present them one at a time as a question or a scenario pointing at the location, e.g. "In `handler.go:42`, what happens if two requests arrive with the same ID?" Let them answer. Then confirm or reveal the issue and discuss the fix. Let them decide how to fix it.
4. Skip nitpicks the formatter or linter would catch.
5. End with one thing done well, specifically, and one habit to carry to the next piece of code.
6. Append the recurring issue types to `~/.claude/coach/weak-spots.md` if they repeat across reviews.
