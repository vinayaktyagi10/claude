---
name: week
description: Daily planner. Sets up a weekly interview-prep plan on first use, then reads the user's logs and says exactly what to do today (commands, time, why). Use at the start of a study session or whenever they ask what to do today.
argument-hint: "[today | week | init | phase foundation|sprint | rest]"
---

# /coach:week

Arguments: `$ARGUMENTS` (default: `today`)

All state is global and local to the machine, in `~/.claude/coach/`. Create the folder if missing. Get today's date and weekday with `date +"%F %A"`; never guess it.

## Files this skill reads
- `plan.md`: the plan settings (below).
- `activity.md`: one line per finished session, `YYYY-MM-DD | skill | target | result`. The other coach skills append to it.
- `dsa-log.md` (lines carry `next: <date>`), `weak-spots.md` (lines carry `box: N, last: <date>`), `stories.md`, `resume.md`.
- In the current directory, if present: `.learning/config.md`, `.learning/vibe-debt.md`, `.learning/journal.md`.

## init (also runs automatically when `plan.md` is missing)
Ask these, one message, with defaults in brackets:
1. How many minutes a day can you spend? [60]
2. Which days off? [Sunday]
3. Any interview or application deadline, and when? [none; sets the phase]
4. Language for DSA? [Go; Python is the alternative]
5. Projects to rotate for `/coach:grill`? [ask them to list; read from `resume.md` if it exists]

Write `plan.md`:
```
phase: foundation        # foundation = steady weekly loop; sprint = interview within about 4 weeks
minutes_per_day: 60
rest_days: sun
language: go
deadline: <date or none>
projects: <comma list>
updated: <date>
```
Set `phase: sprint` if a deadline is within 28 days. Create empty `activity.md` with a header line. Then continue to `today`.

## Weekly template (foundation)
| Day | Slot |
|---|---|
| Mon | `/coach:dsa next` |
| Tue | `/coach:grill <next project in rotation>` |
| Wed | `/coach:dsa next` |
| Thu | `/coach:fundamentals weakest` |
| Fri | `/coach:dsa review` (or `next` if nothing is due) |
| Sat | `/coach:quiz`, plus `/coach:sysdesign mine <project>` on alternate weeks |
| Sun | rest; if not a rest day, `/coach:journal` and `/coach:vibe-debt pay` |

Sprint phase changes the template: DSA every other day with `mock` twice a week; `/coach:grill <project> hard` twice a week; `/coach:behavioral build` until 6 stories exist, then `practice`; `/coach:sysdesign` on classic prompts twice a week; the rest as in foundation.

## today
1. Read the files above. Work out the facts that matter: last date for each skill in `activity.md`; DSA items due (`next:` on or before today); weak-spot items due by Leitner box (1: daily, 2: 3 days, 3: weekly, 4: monthly); how many open vibe-debt items; days since the last journal entry; number of stories in `stories.md`.
2. If today is a rest day, say so, offer one optional light item (`/coach:quiz` 10 minutes), and stop.
3. Choose today's work with this priority, taking the first that applies and up to two items total within `minutes_per_day`:
   1. **Overdue spaced items:** DSA problems past their `next:` date, or weak spots past their box interval, so `/coach:dsa review` or `/coach:quiz`.
   2. **Neglect gaps:** no `grill` in 7+ days; no `fundamentals` in 7+; no `sysdesign` in 14+; no `behavioral` practice in 14+ (or in sprint phase, fewer than 6 stories); no journal in 5+ days when a `.learning/` project is active; more than 10 open vibe-debt items.
   3. **The template slot** for today's weekday.
   If the template slot and a higher-priority item differ, do the higher-priority one and say the slot moves to the next free day.
4. If days were missed, do not stack them. Say "you missed N days; no catch-up needed" and give normal load. Count a missed streak of 3 or more days as a reason to start with a 20 minute easy item.
5. Output exactly this shape, short:
   ```
   Today (<weekday>, <date>) - phase: <phase>, budget: <N> min
   1. <command with arguments>  (<minutes> min) - why: <one specific fact from the logs>
   2. <optional second item>
   Also noticed: <one line, e.g. "7 vibe-debt items open; 3 are security">
   Start with item 1? 
   ```
   Pick the grill target from `projects` by least-recent in `activity.md`. Give the DSA pattern by name when you can ("sliding window, because your last two hinted problems were two-pointers").
6. If the user says yes, run that skill's flow right away (follow its SKILL.md). Do not start anything without their go-ahead.

## week
Show the next 7 days as a table of day and slot, adjusted for what is overdue now, plus a 3 line summary of the last 7 days from `activity.md` (sessions done, per skill) and the single biggest gap.

## phase `<foundation|sprint>`
Update `phase:` and `updated:` in `plan.md`, state what changes, and show `week`.

## rest
Append `YYYY-MM-DD | rest | - | -` to `activity.md` so a missed day is not read as neglect, and say so.

## Rules
- Be honest from the data. If `activity.md` is empty, say this is a fresh start and plan the first week gently (one grill, one DSA, one fundamentals, no more).
- Never invent history. Never mark something done that is not in the logs.
- Keep it to a few lines. This is a daily glance, not a report.
