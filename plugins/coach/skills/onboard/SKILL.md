---
name: onboard
description: Understand an existing codebase (yours or inherited) by predicting first, then reading. Builds a tour, a concept checklist and a first learning plan in .learning/. Use when starting work on an old project.
argument-hint: "[focus area, optional]"
---

# /coach:onboard

Goal: turn "AI wrote most of this" or "I wrote this a year ago" into real understanding of an existing project. Focus: `$ARGUMENTS` (default: the whole project).

## Steps
1. **Setup.** If `.learning/config.md` is missing, run the `/coach:mode` flow first (ask mode and goal).
2. **Survey quietly.** Read the README, the manifest (go.mod, package.json, pyproject), entry points, directory layout, tests, and `git log --oneline | head -40`. Do not dump findings yet.
3. **Predict first.** Ask the user three questions and wait for answers: what does this project do and for whom; what are the 3 or 4 main components and how do they talk to each other; where would a request or piece of data enter and where does it end up. Their guesses reveal what they already know.
4. **Reveal and correct.** Compare against what you found. Be specific about where their model was right, where it was wrong, and why.
5. **Write `.learning/tour.md`:** purpose; an ASCII architecture diagram; the walk-through of 1 or 2 main flows with file and function references; a one-line description per key module; risky or surprising spots (races, global state, missing validation, unexplained magic).
6. **Write `.learning/concepts.md`:** a checklist of concepts the project actually uses (e.g. "goroutines and channels - `server/session.go`", "cursor pagination - `api/list.go`", "RBAC middleware"). Each line: `- [ ] concept - where - status: unknown|shaky|solid`. Ask the user to self-rate, then spot-check three of them with one question each and correct overconfidence gently.
7. **Plan.** Propose the first three exercises, ordered by value, each tied to a real file: trace a flow by hand, explain a function back, fix a small bug without help. Offer `/coach:quiz` and `/coach:explain-back` as follow-ups.

Keep chat replies short; the detail goes in the files. In learn mode the hook allows writes to `.learning/`.
