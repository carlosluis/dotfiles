# My personal dotfiles
---
## Usage
Taken from https://www.atlassian.com/git/tutorials/dotfiles

1. Ignore the folder where you will clone the file
```
echo "dotfiles: >> .gitignore
```

2. Clone dotfiles into a bare repositoyry in `$HOME`:
```
git clone --bare git@github.com:carlosluis/dotfiles.git $HOME/dotfiles
```

3. In case you don't have it in .bashrc, define the alias:
```
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
```

4. Checkout the actual content from the bare repository into `$HOME`
```
dotfiles checkout
```
5. Set the flag `showUntrackedFIles` to `no` on this local repo
```
dotfiles config --local status.showUntrackedFiles no
```
