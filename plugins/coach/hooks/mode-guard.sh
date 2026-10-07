#!/usr/bin/env bash
# PreToolUse guard: in LEARN mode, block Edit/Write on source files.
# Allowed: anything under .learning/, ~/.claude/, test files, and docs (.md/.txt/.rst).
# Exit 2 = block, stderr is shown to Claude.
. "$(dirname "$0")/lib.sh"

[ "$(current_mode)" = "learn" ] || exit 0

input="$(cat)"
if command -v jq >/dev/null 2>&1; then
  path="$(printf '%s' "$input" | jq -r '.tool_input.file_path // .tool_input.notebook_path // empty' 2>/dev/null)"
else
  path="$(printf '%s' "$input" | sed -nE 's/.*"(file_path|notebook_path)"[[:space:]]*:[[:space:]]*"([^"]*)".*/\2/p' | head -1)"
fi
[ -n "$path" ] || exit 0

case "$path" in
  /*) abs="$path" ;;
  *)  abs="$PROJECT_DIR/$path" ;;
esac

case "$abs" in
  "$PROJECT_DIR"/.learning/*) exit 0 ;;
  "$HOME"/.claude/*)          exit 0 ;;
esac

base="$(basename "$abs")"
case "$base" in
  *_test.*|test_*|*.test.*|*.spec.*|*.md|*.txt|*.rst) exit 0 ;;
esac
case "$abs" in
  */tests/*|*/test/*|*/__tests__/*) exit 0 ;;
esac

cat >&2 <<EOF
[coach] LEARN mode blocks edits to source files ($path).
Do not write this code. Instead: ask a guiding question, give the next hint-ladder rung, write a failing
test, or review what the user wrote. If the user wants you to write code, tell them to run
/coach:mode guided (or vibe) themselves. Do not change the mode on your own.
EOF
exit 2
