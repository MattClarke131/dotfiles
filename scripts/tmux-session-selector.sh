#!/usr/bin/env bash

# This script is a simple wrapper around tmux that allows you to select a session
# to attach to using fzf. It also displays a preview of the panes in the selected
# session using bat. This script requires fzf and bat to be installed.


# Preview function that displays the current command and the contents of the
# first few lines of each pane in the selected session.
preview_panes() {
  local header_style="\\e[1;32m" reset_style="\\e[0m"
  local pane_count=$(tmux list-panes -t {1} -F "#{pane_index}" | wc -l)
  local lines_per_pane=$(($(tput lines) / pane_count))

  for i in $(seq 0 $((pane_count - 1))); do
    echo -e "${header_style}Pane $i: $(tmux display-message -p -t {1}.$i "#{pane_current_command}")${reset_style}"
    local content=$(tmux capture-pane -ep -t {1}.$i | head -n $((lines_per_pane - 1)))
    echo "$content" | bat --style=grid --color=always
  done
}


get_session_name() {
  awk -F':' '{ print $1 }'
}

attach_tmux_session() {
  tmux attach -t $(\
    tmux list-sessions\
    | fzf --preview "$(declare -f preview_panes); preview_panes"\
    | get_session_name
  )
}

attach_tmux_session
