---
name: explain-back
description: The user explains recent code or a concept in their own words and gets scored and corrected. Use after non-trivial changes, or when the user wants to check their understanding.
argument-hint: "[file, function or concept; default: the latest change]"
---

# /coach:explain-back

Target: `$ARGUMENTS` (default: the most recent non-trivial change, from `git diff` or `git log -1 -p`).

1. Read the target. Do not show or summarize it yet.
2. Ask the user to explain it as if teaching a teammate, without looking at the code. One short paragraph is enough.
3. Ask up to three follow-ups, one at a time: what happens on the unhappy path or an edge case; why this approach over a specific alternative; what would break if a named piece changed.
4. Score each of (what, why, failure modes) as solid / partial / missing. Be honest and specific; praise what is right.
5. Correct the gaps briefly with reference to the actual lines.
6. Record: if anything was partial or missing, set the matching line in `.learning/vibe-debt.md` to shaky (or add one), and add the concept to `.learning/concepts.md` if the file exists. If everything was solid, check the item off.
7. Offer one retry on the weakest point, reworded.

Never answer for them before they try. A confident-sounding but wrong explanation is the most valuable thing to catch.
