#!/usr/bin/env bash
# create symlinks to dot files

# Exit if a command exits with a non-zero status
# Some people on the internet think this isn't a great practice
set -e


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

# Create symlinks
link_file "$DOTFILES_ROOT"/.vimrc ~/.vimrc
link_file "$DOTFILES_ROOT"/zsh/.zshrc ~/.zshrc
link_file "$DOTFILES_ROOT"/.tmux.conf ~/.tmux.conf

# Load dotfiles in current session
source $HOME/.zshrc
