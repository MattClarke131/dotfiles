## setup
1. Clone this repo
1. Run Install script
```bash
./install.sh
```
1. Install homebrew
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```
1. setup crons
```bash
crontab -e
```

 ```crontab
#Git fetch every repo every 5 minutes
 */5 * * * * "$HOME"/dotfiles/scripts/git-fetch.sh > /dev/null &>
```

1. install submodules
```bash
git submodule update
```



### customization
git ignores files ending in `.local`. These files are for commands that I don't want on a public repo

### Shellcheck
I use this to check my scripts
https://github.com/koalaman/shellcheck

### inspirations
https://github.com/ajmalsiddiqui/dotfiles
https://github.com/mathiasbynens/dotfiles
https://github.com/paulmillr/dotfiles
https://github.com/holman/dotfiles

### Goals
1. This can be cloned from anywhere
2. $HOME dir isn't filled with noise
3. Minimize global variables


### Shell bindings
#### FZF
Source: [junegunn/FZF](https://github.com/junegunn/fzf#key-bindings-for-command-line)

More Info: [Here](  https://github.com/junegunn/fzf#fuzzy-completion-for-bash-and-zsh)

* **CTRL-T**
  paste selected files and directories onto the command-line

* **CTRL-R**
  paste the selected command from history onto the command line

* **ALT-C**
  cd into the selected directory

* **CTRL-J / CTRL-K** (or **CTRL-N / CTRL-P**)
  Move up and down

* **CTRL-C / CTRL-G / ESC**
  exit
