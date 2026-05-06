#!/usr/bin/env bash

PLUGIN_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
THEME_OPTION="@thorn-tmux"
DEFAULT_OPTION="forest"

theme() {
  local option="$1"
  local default="$2"
  local option_val
  option_val=$(tmux show-option -gqv "$option")
  if [ -z "$option_val" ]; then
    echo "$default"
  else
    echo "$option_val"
  fi
}

main() {
  local theme
  theme=$(theme "$THEME_OPTION" "$DEFAULT_OPTION")
  tmux source-file "$PLUGIN_DIR/thorn-${theme}.conf"
}

main
