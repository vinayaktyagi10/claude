---
name: fundamentals
description: Targeted CS fundamentals drills (OS, networking, databases, concurrency, Go internals, Linux and containers, security) tied to technology the user has actually used. Use to close theory gaps before interviews.
argument-hint: "[area | weakest]"
---

# /coach:fundamentals

Arguments: `$ARGUMENTS`

## Areas, with an angle from the user's stack
- **OS:** processes vs threads, scheduling, virtual memory and paging, syscalls, file descriptors, signals. Angle: OOM kills, cgroups limits.
- **Networking:** TCP handshake and congestion, TLS, DNS, HTTP/1.1 vs 2, NAT. Angle: SSH key exchange and channels, Tailscale or WireGuard, Cloudflare Tunnel.
- **Databases:** indexes (B-tree), query plans, transactions, isolation levels and MVCC, locks, replication, pagination. Angle: PostgreSQL pools, cursor pagination, idempotent bulk upload.
- **Concurrency:** races, mutexes, deadlock, memory models, channels. Angle: concurrent SSH channels, worker pools, Redis Streams consumers.
- **Go:** goroutine scheduler, channels, GC, slices and maps, interfaces, context, escape analysis.
- **Linux and containers:** namespaces, cgroups, overlay filesystems, image layers, capabilities, non-root. Angle: Docker image shrink, rootless containers.
- **Security:** authn vs authz, WebAuthn, hashing vs encryption, CVSS, RCE classes, SSRF, injection. Angle: the React Server Components CVE, scrypt, hash-chained logs.
- **Distributed systems:** CAP, consensus basics, idempotency, retries and backoff, queues, eventual consistency.

## Routine
1. Pick the area: the one given, or `weakest` from `~/.claude/coach/weak-spots.md`, otherwise the one with the least coverage.
2. Run six questions, escalating from definition to "why" to "what happens when". Start each from something the user has used ("In your Postgres setup, what stops two concurrent writers corrupting the same row?"). One at a time; no hints unless asked.
3. After each answer give a two to four line gold-standard answer and mark it solid, partial or miss.
4. Finish with the three most important gaps, a compact explanation of each, and one hands-on experiment they can run in their own project to see it (e.g. start two psql sessions and observe the lock, run `strace`, set a cgroup limit).
5. Log misses to `~/.claude/coach/weak-spots.md` as `- YYYY-MM-DD <topic> (fundamentals) - box: 1, last: <date>` so `/coach:quiz` brings them back.

## Activity log
As the final step, append one line to `~/.claude/coach/activity.md` (create it if missing): `YYYY-MM-DD | fundamentals | <area> | <solid>/<asked> solid`. This feeds `/coach:week`.
