---
name: vibe-debt
description: Review and pay down the ledger of things shipped without full understanding. Triage by risk, then turn items into short learning sessions.
argument-hint: "[add <text> | list | pay]"
---

# /coach:vibe-debt

Arguments: `$ARGUMENTS`

The ledger is `.learning/vibe-debt.md`, with items like `- [ ] 2026-10-07 session registry (server/session.go) - concept: mutexes vs channels`.

- **add `<text>`**: append an unchecked item with today's date.
- **list** (default): show open items grouped by risk, highest first. Risk order: security and auth, concurrency and data integrity, infra and deployment, business logic, UI. Show the count and the oldest item.
- **pay**: take the highest-risk open item and run a payoff session:
  1. Ask the user what they think the code does. Do not explain first.
  2. Open the code, walk through it with them, and fill the gaps.
  3. Run `/coach:explain-back` on it. If they pass, check it off and note the date. If not, leave it open with a note on what was missing.
  4. Offer a tiny exercise: change the behavior slightly, or write the test they would want.

Never delete items; check them off. When the open list gets long (over 10), say so and recommend a payoff session before more vibe coding.
