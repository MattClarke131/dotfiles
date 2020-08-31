#!/usr/bin/env zsh
#### Description: Fetches repositories, echos if repo is behind
####              If this is run in a cron, it will generate mail

declare -ar REPOSITORIES=(
  "$HOME"/dotfiles
  "$HOME"/gtd
)

for REPO in "${REPOSITORIES[@]}"
do
  if [ -d $REPO ]
  then
    cd "$REPO" || exit
    git fetch
  fi
done
