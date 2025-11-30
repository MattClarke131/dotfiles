#!/usr/bin/env zsh

# A menu script for running favorite commands using fzf

local favorites=(
  "#1 Getting Things Done::gtd"
  "#2 Dotfiles::cd ~/dotfiles"
  "#3 Code For Boston::cd ~/dev/boston-liquor-license-tracker"
  "#4 Weather::curl wttr.in"
)


function favorites_menu() {
  local selected
  selected=$(printf '%s\n' "${favorites[@]}" | fzf --reverse --delimiter="::" --with-nth 1)
  if [[ -n "$selected" ]]; then
    local command="${selected##*::}"
    eval "$command"
  fi
}
