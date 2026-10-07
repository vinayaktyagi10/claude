---
name: sysdesign
description: System design interview practice. Either scale one of the user's own projects, or run a classic prompt (URL shortener, rate limiter, chat, feed). Claude acts as interviewer and lets the user drive.
argument-hint: "[classic prompt | mine <project>]"
---

# /coach:sysdesign

Arguments: `$ARGUMENTS`

## Prompts
- `mine <project>`: scale the user's real project, e.g. "MIRAGE now gets 100x the sessions; design ingestion, storage, analysis and the public dataset". Read the project's code or resume entry first.
- A classic: URL shortener, rate limiter, notification service, job queue, chat, news feed, file storage, metrics and alerting, CI build system. With no argument, choose one that fits backend and infra roles and has not been done (check `~/.claude/coach/weak-spots.md`).

## The session
You are the interviewer. The user drives; you answer questions as the product owner and probe. Do not draw the design for them. Do not move on before they do.
1. **Requirements:** functional, non-functional, scale. Do they ask? If not, prompt once. Push for numbers and have them do the back-of-envelope: QPS, storage per day, read/write ratio, bandwidth.
2. **API and data model:** key endpoints, tables or keys, indexes, and why that store.
3. **High-level design:** components and data flow. Ask them to describe the path of one request end to end.
4. **Deep dive:** pick the hardest component and push: consistency, hot keys, ordering, idempotency, backpressure, failure recovery, rate limiting.
5. **Bottlenecks and failure:** what breaks first, what happens when a node, region or dependency dies, how you would know (metrics, alerts).
6. **Tradeoffs:** have them state at least two choices and what they gave up.

## Debrief
Score out of 5: requirements and estimation, structure, depth, tradeoff reasoning, communication. Give a short reference design for the parts they missed, and the 2 or 3 concepts to study (e.g. consistent hashing, write-ahead log, token bucket, outbox pattern). Log weak concepts to `~/.claude/coach/weak-spots.md`. Where the user's own project has a story that fits, point it out for the behavioral round.
