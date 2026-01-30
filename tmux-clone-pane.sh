#!/bin/bash
#
# Bala Magic
#
# "clones" the current pane into a new pane or window and runs the command of
# the current foreground process in the new pane or window. when there are
# multiple generations of child processes in the current pane user is prompted
# to pick one from the tree
#
# $0 <direction=h|v>
#   default split direction = -v i.e. vertical

# set -x
direction=${1:-v}

# get pane_pid of current pane
curr_pane_id=$(tmux display-message -p '#{pane_id}')
pane_fg_pid=$(tmux list-panes -F '#{pane_id} #{pane_pid}' | grep "$curr_pane_id" | awk '{print $2}')

# pstree -aAl <pid> would be ideal, but produces inconsistent output for some commands,
# so just parse the pids and extract commands & args via ps
declare -a child_pids
while IFS= read -r line; do
  child_pids+=("$line")
done < <(pstree -p "$pane_fg_pid" | grep -Eo '[0-9]*')

fzf_input=$(
  for ((i = ${#child_pids[@]} - 1; i >= 0; i--)); do
    ps -p "${child_pids[i]}" -o args=
  done
)
fzf_input=$(echo "$fzf_input" | sed '/launchd/d')

read -r x y < <(tmux display-message -p '#{e|+:#{cursor_x},#{e|+:#{window_offset_x},#{pane_left}}} #{e|+:#{cursor_y},#{e|+:#{window_offset_y},#{pane_top}}}')
target_cmd=$(echo "$fzf_input" |
  command fzf-tmux -p -x "$x" -y "$y" -h 10 -w 80 \
    --border=rounded --prompt="current pane pid tree> " \
    --cycle --select-1 --no-sort)
if [ "$?" -eq 130 ]; then
  exit 0
fi

case "$direction" in
w)
  tmux new-window -c '#{pane_current_path}' "$target_cmd"
  ;;
*)
  tmux split-window -c '#{pane_current_path}' -"$direction" "$target_cmd"
  ;;
esac
