#!/usr/bin/env bash
# ^ logical link to path

# This script will create symlinks to dot files

# Exit if a command exits with a non-zero status
# Some people on the internet think this isn't a great practice
set -e

# change to parent directory of this script
cd "$(dirname "$0")"
DOTFILES_ROOT=$(pwd -P)


# Creates a symlink
# arg 1: source file
# arg 2: destination file
link_file () {
  local source=$1 destination=$2

  local proceed=true

  # Does the destination file already exist?
  if test -f "$destination" ; then
    echo "$destination" "exists. Overwrite? (y/n)"
    read -r resp
    if [ "$resp" != 'y' ] && [ "$resp" != 'Y' ] ; then
      proceed=false
    fi
  fi


  if [ $proceed = true ] ; then
    ln -sfv "$source" "$destination"
  fi
}


#create symlinks for dotfiles
link_file "$DOTFILES_ROOT"/.vimrc "$HOME"/.vimrc
link_file "$DOTFILES_ROOT"/zsh/.zshrc "$HOME"/.zshrc
link_file "$DOTFILES_ROOT"/.tmux.conf "$HOME"/.tmux.conf

source "$HOME"/.zshrc
