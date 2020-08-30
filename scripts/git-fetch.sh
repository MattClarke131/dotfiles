#!/usr/bin/env bash
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

    diff=$(git diff origin/master | wc -c)
    if [ $diff -ne 0 ]
    then
      echo "$REPO has updates!"
    fi
  fi
done
