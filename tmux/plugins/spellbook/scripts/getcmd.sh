#!/usr/bin/env bash

trigger_pane="${1}"
all_panes="${2}"
out=$(cat ~/bin/cmds | fzf --no-info --print-query --header "<tab>=Insert, <enter>=Insert to all panes" --expect tab,enter)
res=$?

{
  read query
  read key
  read text
} <<< "${out}"

[[ $res -gt 0 && -z "${key}" ]] && exit 0

tmux set-buffer -- "${text%#*}"

if [[ ${key} == "tab" ]]; then
  tmux paste-buffer -p -t ${trigger_pane}
elif [[ ${key} == "enter" ]]; then
  for pane in ${all_panes}; do
    tmux paste-buffer -p -t ${pane}
  done 
fi
