---
name: dsa
description: Pattern-based data structures and algorithms practice with a hint ladder, a complexity check and spaced re-practice of failed problems. The user writes all the code.
argument-hint: "[pattern | next | review | mock]"
---

# /coach:dsa

Arguments: `$ARGUMENTS`

Log: `~/.claude/coach/dsa-log.md`, one line per attempt: `- YYYY-MM-DD <problem> | <pattern> | <solo|hint-N|failed> | <minutes> | next: <date>`. Create it if missing.

## Choosing a problem
- A pattern name: pick a problem for it. `next`: the pattern after the user's last one, or the weakest by the log. `review`: a failed or hinted problem due for repeat (re-practice after 3, 7, then 14 days). `mock`: a 30 minute timed session, medium difficulty, no hints until 15 minutes in.
- Patterns, in rough order: arrays and hashing, two pointers, sliding window, stack, binary search, linked lists, trees (DFS, BFS), heaps, intervals, graphs (BFS, DFS, topological sort), union-find, backtracking, 1D and 2D DP, greedy, tries, bit tricks.
- Use well-known problems by title and difficulty, and always write out the full statement and examples yourself so no lookup is needed. Ask which language they want (Go or Python by default).

## The routine (enforce it; this is the interview habit)
1. User restates the problem in their own words and asks clarifying questions. Answer them as an interviewer would.
2. User lists examples and edge cases (empty, one element, duplicates, negatives, overflow, large input).
3. User gives a brute force and its time and space complexity.
4. User proposes the optimization. Use the hint ladder from `/coach:hint` if stuck; track the rung.
5. User writes the code in their editor or the chat. You do not write it. Wait for it.
6. User dry-runs it on an example, out loud.
7. You review: bugs, complexity statement check, then one follow-up variation ("now the stream is unbounded").

## After
Say how it went honestly and log the line. If a pattern fails twice, drop to an easier problem in that pattern, not a harder one. End with the pattern's reusable template in two lines, and a pointer to what the next session should be.

## Activity log
As the final step, append one line to `~/.claude/coach/activity.md` (create it if missing): `YYYY-MM-DD | dsa | <problem, pattern> | <solo|hint-N|failed>`. This feeds `/coach:week`.
