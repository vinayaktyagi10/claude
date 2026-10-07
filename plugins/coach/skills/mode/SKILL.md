---
name: mode
description: Set or show this project's coach mode (vibe, guided, learn) and create the .learning/ folder. Use only when the user runs it.
argument-hint: "[vibe|guided|learn|status]"
disable-model-invocation: true
---

# /coach:mode

Arguments: `$ARGUMENTS`

The mode lives in `.learning/config.md` in the project root. A SessionStart hook loads its rules; a PreToolUse hook enforces learn mode (it reads the file on every edit, so a switch takes effect immediately; the full rule text reloads next session).

## Modes
- **vibe**: you build, the user gets speed. Non-trivial things you ship get logged to `.learning/vibe-debt.md`.
- **guided**: you do boilerplate, the user writes core logic, and every non-trivial change ends with an explain-back question.
- **learn**: the user writes all source code. You ask, hint, review, and write tests. Source edits are blocked by a hook.

## Steps
1. Read `.learning/config.md` if it exists. With no argument or `status`, show the current mode, goal, open vibe-debt count and stop.
2. With no argument and no config, ask which mode (and the project goal in one line, e.g. "learn Go concurrency properly" or "ship a quick tool"). Recommend one based on the goal.
3. Create `.learning/` if missing, with these files (skip any that exist):
   - `config.md`:
     ```
     mode: <mode>
     goal: <one line>
     started: <YYYY-MM-DD>
     ```
   - `journal.md`: `# Journal` heading only.
   - `vibe-debt.md`: `# Vibe debt` heading and one line explaining it: things shipped that the user may not fully understand yet. Check items off once explained back.
4. If config exists, change only the `mode:` line.
5. Confirm in one or two lines. If the new mode is learn, say what is blocked and what is not. If leaving learn mode, ask whether anything from the session should go in vibe-debt.
6. Suggest committing `.learning/`; it doubles as study notes.

You are allowed to edit `.learning/` in every mode. Never change the mode unless the user ran this command.
