#!/usr/bin/env zsh
# ^ logical link to path

# This script will create symlinks to dot files

# Exit if a command exits with a non-zero status
# Some people on the internet think this isn't a great practice
set -e

# change to parent directory of this script
cd "$(dirname "$0")"
DOTFILES_ROOT=$(pwd -P)

# create subdirectory for current time this script is run
DOTFILES_OLD_DIR=$DOTFILES_ROOT/dotfiles_old/$(date +%G-%m-%d_%H-%M-%S)
mkdir -p "$DOTFILES_OLD_DIR"
mkdir "$DOTFILES_OLD_DIR"/vim
mkdir "$DOTFILES_OLD_DIR"/zsh
mkdir "$DOTFILES_OLD_DIR"/git


install_dotfile () {
  local source=$1 destination=$2 backup_destination=$3

  # return out of install_dotfile() if source file does not exist
  if [ ! -f "$source" ]; then
    return
  fi

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

# Make .vim directory if it doesn't exist
[ -d "$HOME"/.vim ] || mkdir "$HOME"/.vim
# Make .vim/sessions directory if it doesn't exist
[ -d "$HOME"/.vim/sessions ] || mkdir "$HOME"/.vim/sessions
# Make .vim/swapfiles directory if it doesn't exist
[ -d "$HOME"/.vim/swapfiles ] || mkdir "$HOME"/.vim/swapfiles
# Make .vim/undofiles directory if it doesn't exist
[ -d "$HOME"/.vim/undofiles ] || mkdir "$HOME"/.vim/undofiles

# Make .config directory if it doesn't exist
[ -d "$HOME"/.config ] || mkdir "$HOME"/.config
# Make .config/nvim directory if it doesn't exist
[ -d "$HOME"/.config/nvim ] || mkdir "$HOME"/.config/nvim

# Install dotfiles
echo "################################################################################"
echo "Creating symlinks for dot files"
install_dotfile "$DOTFILES_ROOT"/vim/vimrc "$HOME"/.vimrc "$DOTFILES_OLD_DIR"/vim/vimrc
install_dotfile "$DOTFILES_ROOT"/vim/init.lua "$HOME"/.config/nvim "$DOTFILES_OLD_DIR"/vim/init.lua
install_dotfile "$DOTFILES_ROOT"/zsh/zshrc "$HOME"/.zshrc "$DOTFILES_OLD_DIR"/zsh/zshrc
install_dotfile "$DOTFILES_ROOT"/zsh/p10k.zsh "$HOME"/.p10k.zsh "$DOTFILES_OLD_DIR"/zsh/p10k.zsh
install_dotfile "$DOTFILES_ROOT"/tmux.conf "$HOME"/.tmux.conf "$DOTFILES_OLD_DIR"/tmux.conf
install_dotfile "$DOTFILES_ROOT"/rsync-excludes "$HOME"/.rsync-excludes "$DOTFILES_OLD_DIR"/rsync-excludes
install_dotfile "$DOTFILES_ROOT"/git/gitconfig "$HOME"/.gitconfig "$DOTFILES_OLD_DIR"/git/gitconfig
echo "################################################################################"
echo "symlinks created"

set +e
echo "################################################################################"
echo "sourcing zshrc"
# shellcheck source=/home/matt/.zshrc
source "$HOME"/.zshrc


echo "################################################################################"
echo "INSTALLATION COMPLETE"
echo "################################################################################"
