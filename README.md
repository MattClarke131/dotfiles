### setup
clone repo

`$ ./install.sh`

setup crons
  # Git fetch every repo every 5 minutes
  `*/5 * * * * "$HOME"/dotfiles/scripts/git-fetch.sh > /dev/null &>`


`$ crontab -e`

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
