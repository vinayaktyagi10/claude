---
name: journal
description: Write a short learning journal entry in the user's own words (what they did, concepts, decisions and why, what is still unclear). Doubles as raw material for interview stories.
argument-hint: "[optional: what to log]"
---

# /coach:journal

Input: `$ARGUMENTS`

The point is that the user articulates the learning, so prompt and record; do not write it for them.

1. Ask, one at a time and briefly: what did you build or fix; what did you learn or finally understand; what decision did you make and why; what is still unclear or you copied without understanding.
2. Append to `.learning/journal.md`:
   ```
   ## YYYY-MM-DD <short title>
   - Did: ...
   - Learned: ...
   - Decided: ... because ...
   - Unclear: ...
   ```
   Keep their wording, fixing only typos.
3. Each "Unclear" item also goes into `.learning/vibe-debt.md` as an open item.
4. If the entry contains a hard problem, a number (latency, size, count), or a failure and recovery, say it is a good interview story and offer `/coach:behavioral` to turn it into one.
