#!/usr/bin/env bash
# Shared helpers: find the project's .learning/config.md and read its fields.

PROJECT_DIR="${CLAUDE_PROJECT_DIR:-$PWD}"
CONFIG="$PROJECT_DIR/.learning/config.md"

# config_field <name> -> value of a "name: value" line, lowercased for mode only by caller
config_field() {
  [ -f "$CONFIG" ] || return 0
  grep -m1 -iE "^$1[[:space:]]*:" "$CONFIG" | sed -E 's/^[^:]*:[[:space:]]*//; s/[[:space:]]+$//'
}

# current_mode -> vibe|guided|learn|none (none = no config file)
current_mode() {
  if [ ! -f "$CONFIG" ]; then echo none; return; fi
  local m
  m="$(config_field mode | tr '[:upper:]' '[:lower:]' | tr -d '[:space:]')"
  case "$m" in
    vibe|guided|learn) echo "$m" ;;
    *) echo vibe ;;
  esac
}
