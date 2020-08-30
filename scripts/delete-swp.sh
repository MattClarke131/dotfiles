#!/usr/bin/env zsh
#### DESCRIPTION: Finds and deletes all .swp files within current directory (and its children)

num_processes=$(ps -aux | grep vim | wc -l)
if [ $num_processes -gt 1 ]
then
  echo "You have vim sessions running!"
  echo "(Ignore the grep process)"
  echo "$(ps -aux | grep vim)"
  echo ""
  echo "Proceed anyway? (y/n)"
  read response
  if [ $response == 'y' ]
  then
    find . -name '*.swp' -exec rm {} \;
  fi
else
  find . -name '*.swp' -exec rm {} \;
fi
