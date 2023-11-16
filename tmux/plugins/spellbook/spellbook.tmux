#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

tmux bind s run-shell "\"${CURRENT_DIR}/scripts/run.sh\" \"#{pane_id}\""

