#!/bin/bash
#### Description: Fetches repositories

declare -ar REPOSITORIES=(
  "$HOME"/dotfiles
  "$HOME"/gtd
)

for REPO in "${REPOSITORIES[@]}"
do
  if [ -d REPO ]
  then
    cd "$REPO" || exit
    git fetch
  fi
done
