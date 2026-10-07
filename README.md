# vinayak-tools

Personal Claude Code marketplace. One plugin so far: **coach**, which keeps AI from doing all the learning for you and prepares you for interviews.

## Install

```
/plugin marketplace add vinayaktyagi10/claude
/plugin install coach@vinayak-tools
```

Then restart Claude Code (or run `/reload-plugins`). Skills show up namespaced as `/coach:<name>`.

To try it without installing: `claude --plugin-dir ./plugins/coach`.

Requires `bash`; `jq` is used if present (falls back to `sed`).

## Modes (per project)

Each project has `.learning/config.md` with `mode: vibe | guided | learn`. Run `/coach:mode` in a project to set it.

| Mode | Claude | Enforced by |
|---|---|---|
| vibe | Builds freely; logs non-trivial things to `.learning/vibe-debt.md` | session rules |
| guided | Writes boilerplate; you write core logic; explain-back after changes | session rules |
| learn | Never writes source; hints, questions, reviews, tests only | session rules + a hook that blocks Edit/Write on source files |

In learn mode the hook still allows `.learning/`, `~/.claude/`, test files (`*_test.*`, `test_*`, `*.test.*`, `*.spec.*`, `tests/`) and docs (`.md`, `.txt`, `.rst`).

Limit: the guard blocks Claude's file-edit tools. A determined Bash redirect (`echo > file`) is not blocked; the session rules tell Claude not to do it.

## Skills

| Command | Use |
|---|---|
| `/coach:mode` | Set or show the project's mode, create `.learning/` |
| `/coach:onboard` | Old project: predict, then tour, concept checklist, first exercises |
| `/coach:kickoff` | New project: you write the spec and decisions before code |
| `/coach:hint` | Hint ladder (nudge, direction, outline, snippet) |
| `/coach:explain-back` | Explain recent code in your own words, get scored |
| `/coach:review-me` | Socratic review of your code (never edits) |
| `/coach:quiz` | Spaced repetition from your notes and weak spots |
| `/coach:journal` | Log learning in your own words |
| `/coach:vibe-debt` | Triage and pay off what you shipped without understanding |
| `/coach:grill` | Mock interviewer on your own resume and code |
| `/coach:dsa` | Pattern-based DSA practice with logging |
| `/coach:sysdesign` | System design on your projects or classic prompts |
| `/coach:fundamentals` | OS, networking, DB, Go, containers, security drills |
| `/coach:behavioral` | STAR story bank, practice, "tell me about yourself" |

## Where data lives

- Per project: `.learning/` (config, journal, vibe-debt, tour, concepts, spec, decisions). Commit it; it is your study notes.
- Global, local to your machine: `~/.claude/coach/` (`resume.md`, `weak-spots.md`, `dsa-log.md`, `stories.md`). It holds your resume text, so keep it out of any repo.

## Suggested start

1. In an old project: `/coach:mode learn`, then `/coach:onboard`.
2. Once a week: `/coach:grill` on a project, `/coach:dsa next`, `/coach:fundamentals weakest`.
3. Before interviews: `/coach:behavioral build`, `/coach:sysdesign mine <project>`, `/coach:grill hard`.
