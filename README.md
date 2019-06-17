### setup
clone repo into ~/dotfiles

`$ ./bootstrap.sh`

### customization
git ignores files ending in `.local`. These files are for commands that I don't want on a public repo

### inspirations
https://github.com/ajmalsiddiqui/dotfiles

https://github.com/mathiasbynens/dotfiles

https://github.com/paulmillr/dotfiles

https://github.com/holman/dotfiles

### notes / to do
My goals for this repo are
1. It can be cloned anywhere
2. I don't want to excessively clutter my ~ dir
3. I don't create global variables to bootstrap

afaic I have achieved 2 and 3, but I need to work on 1.
I have hardcoded the path to aliases in `.zshrc`
