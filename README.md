## How to install
1. Install [oh-my-zsh](https://ohmyz.sh/#install)
2. Clone this repo
```console
git clone git@github.com:MattClarke131/dotfiles.git

```
3. Install submodules
```console
git submodule init
git submodule update
```
4. Install [homebrew](https://brew.sh/)
5. Install homebrew packages
```console
brew bundle install
```
6. Install node packages
```console
npm install
```
7. Run fzf install script
```console
$(brew --prefix fzf)/install
```
8. Run install script
```console
./install.sh
```
9. Setup crons
```console
crontab -e
```
```crontab
#Git fetch every repo every 5 minutes
 */5 * * * * "$HOME"/dotfiles/scripts/git-fetch.sh &> /dev/null
```

## customization
git ignores files ending in `.local`. These files are for commands that I don't want on a public repo

## Shellcheck
I use this to check my scripts
https://github.com/koalaman/shellcheck

## inspirations
https://github.com/ajmalsiddiqui/dotfiles
https://github.com/mathiasbynens/dotfiles
https://github.com/paulmillr/dotfiles
https://github.com/holman/dotfiles
