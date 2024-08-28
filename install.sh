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
BACKUP_DOTFILES=$DOTFILES_ROOT/backup-dotfiles/$(date +%G-%m-%d_%H-%M-%S)
mkdir -p "$BACKUP_DOTFILES"
mkdir "$BACKUP_DOTFILES"/nvim
mkdir "$BACKUP_DOTFILES"/zsh
mkdir "$BACKUP_DOTFILES"/git


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

# Make .tmux/plugins directory if it doesn't exist
[ -d "$HOME"/.tmux/plugins ] || mkdir -p "$HOME"/.tmux/plugins
# copy tpm submodule into plugins directory if  it doesn't exist
[ -d "$HOME"/.tmux/plugins/tpm ] || cp -r "$DOTFILES_ROOT"/submodules/tpm "$HOME"/.tmux/plugins/

# Install dotfiles
echo "################################################################################"
echo "Creating symlinks for dot files"
echo "--------------------------------------------------------------------------------"
# install nvim config
ln -sfvn "$DOTFILES_ROOT"/nvim $HOME/.config/nvim
# install zsh plugins
ln -sfvn  "$DOTFILES_ROOT"/submodules/zsh-autosuggestions "$HOME"/.oh-my-zsh/plugins/zsh-autosuggestions
ln -sfvn  "$DOTFILES_ROOT"/submodules/zsh-syntax-highlighting "$HOME"/.oh-my-zsh/plugins/zsh-syntax-highlighting
# install bat config
ln -sfvn "$DOTFILES_ROOT"/bat $HOME/.config/bat
#
install_dotfile "$DOTFILES_ROOT"/zsh/zshrc "$HOME"/.zshrc "$BACKUP_DOTFILES"/zsh/zshrc
install_dotfile "$DOTFILES_ROOT"/zsh/p10k.zsh "$HOME"/.p10k.zsh "$BACKUP_DOTFILES"/zsh/p10k.zsh
install_dotfile "$DOTFILES_ROOT"/tmux.conf "$HOME"/.tmux.conf "$BACKUP_DOTFILES"/tmux.conf
install_dotfile "$DOTFILES_ROOT"/rsync-excludes "$HOME"/.rsync-excludes "$BACKUP_DOTFILES"/rsync-excludes
install_dotfile "$DOTFILES_ROOT"/git/gitconfig "$HOME"/.gitconfig "$BACKUP_DOTFILES"/git/gitconfig
echo "--------------------------------------------------------------------------------"
echo "symlinks created"
echo "################################################################################"
echo "INSTALLATION COMPLETE"
echo "################################################################################"
