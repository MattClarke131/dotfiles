#!/bin/bash
#### Description: Fetches repositories

declare -ar REPOSITORIES=(
  "$HOME"/dotfiles
  "$HOME"/gtd
)

for REPO in "${REPOSITORIES[@]}"
do
  cd "$REPO" # || exit
  git fetch
done
