#!/usr/bin/env bash

#CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

tmux bind A popup -h 14 -w 30 -x R -y popup_pane_top -E "alive"
