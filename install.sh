#!/usr/bin/env bash
# ^ logical link to path

# This script will create symlinks to dot files

# Exit if a command exits with a non-zero status
# Some people on the internet think this isn't a great practice
set -e

# change to parent directory of this script
cd "$(dirname "$0")"
DOTFILES_ROOT=$(pwd -P)

#create subdirectory for current time this script is run
DOTFILES_OLD_DIR=$DOTFILES_ROOT/dotfiles_old/$(date +%G-%m-%d_%H-%M-%S)
mkdir -p "$DOTFILES_OLD_DIR"



install_dotfile () {
  local source=$1 destination=$2 backup_destination=$3

  # Create copy of destination in backup_destination
  if test -f "$destination" ; then
    create_backup_file "$destination" "$backup_destination"
    echo "existing $destination moved to $backup_destination"
  fi

  # Create symlink at destination pointing to source
  ln -sfv "$source" "$destination"
}

create_backup_file () {
  local source=$1 destination=$2
  cp "$1" "$2"
}

# Install dotfiles
echo "Creating symlinks for dot files"
install_dotfile "$DOTFILES_ROOT"/vimrc "$HOME"/.vimrc "$DOTFILES_OLD_DIR"/vimrc
install_dotfile "$DOTFILES_ROOT"/zshrc "$HOME"/.zshrc "$DOTFILES_OLD_DIR"/zshrc
install_dotfile "$DOTFILES_ROOT"/tmux.conf "$HOME"/.tmux.conf "$DOTFILES_OLD_DIR"/tmux.conf
install_dotfile "$DOTFILES_ROOT"/rsync-excludes "$HOME"/.rsync-excludes "$DOTFILES_OLD_DIR"/rsync-excludes
install_dotfile "$DOTFILES_ROOT"/gitconfig "$HOME"/.gitconfig "$DOTFILES_OLD_DIR"/gitconfig
echo "symlinks created"

echo "sourcing zshrc"
source "$HOME"/.zshrc
