#!/usr/bin/env zsh

# A menu script for running favorite commands using fzf

local favorites=(
  "#1 GTD::gtd"
  "#2 Dotfiles::cd ~/dotfiles"
  "#3 Circular Economy (Code for Boston)::cd ~/dev/boston-circular-economy"
  "#4 frankly::cd ~/dev/frankly/"
  "#5 Project Seeds::cd ~/dev/project-seeds"
)


function favorites_menu() {
  local selected
  selected=$(printf '%s\n' "${favorites[@]}" | fzf --reverse --delimiter="::" --with-nth 1)
  if [[ -n "$selected" ]]; then
    local command="${selected##*::}"
    eval "$command"
  fi
}
