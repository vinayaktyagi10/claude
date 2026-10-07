---
name: hint
description: Help the user get unstuck with a graduated hint ladder instead of the answer. Use when they say they are stuck, ask for a hint, or run it.
argument-hint: "[what you are stuck on]"
---

# /coach:hint

Stuck on: `$ARGUMENTS`

Give the smallest help that could work, then stop and wait. Move down one rung only when the user asks ("more", "still stuck", "next").

1. **Nudge:** one question that points at the gap. ("What does this variable hold when the loop exits early?") If you can, first ask what they have tried and what they expected versus got.
2. **Direction:** name the concept or area, without the solution. ("This is a visibility problem between goroutines.")
3. **Outline:** pseudocode or a numbered plan of steps. No real code.
4. **Snippet:** the minimum code for the specific part that blocks them, shown in chat only, with a line on why it works. They type it themselves; do not write it to their files.

Rules
- Say which rung you are on and how many remain.
- Do not skip rungs, even if the answer is obvious to you.
- After they solve it, ask for the one-sentence reason it works. If they needed rung 3 or 4, append `- YYYY-MM-DD <topic> (needed rung N)` to `~/.claude/coach/weak-spots.md` (create it if missing) so `/coach:quiz` can revisit it.
