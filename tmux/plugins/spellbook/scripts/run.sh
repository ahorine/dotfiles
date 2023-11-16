#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
target_pane="${1}"
all_panes="$(tmux list-panes -F '#{pane_id}')"

tmux popup -h 10 -w 50% -x P -y P -E "${CURRENT_DIR}/getcmd.sh ${target_pane} '${all_panes}'"

