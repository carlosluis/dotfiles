# My personal dotfiles

## Importing the dotfiles
Taken from https://www.atlassian.com/git/tutorials/dotfiles

1. Go to home directory and ignore the folder where you will clone the file
```
cd
echo "dotfiles" >> .gitignore
```

2. Clone dotfiles into a bare repository in `$HOME`:
```
git clone --bare git@github.com:carlosluis/dotfiles.git $HOME/dotfiles
```

3. In case you don't have it in .bashrc, go to the file add this line to define the alias:
```
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
```

4. Source your changes
```
source ~/.bashrc
```

5. Checkout the actual content from the bare repository into `$HOME`
```
dotfiles checkout
```

6. Set the flag `showUntrackedFIles` to `no` on this local repo
```
dotfiles config --local status.showUntrackedFiles no
```

## Modifying the dotfiles and commiting the changes
Let's say you modified the .bashrc file and want to commit the change
1. Go to `$HOME` and verify the status of the dotfiles repo
```
cd
dotfiles status
```

2. You can now verify all your unstaged changes and perform regulat git operations but using the `dotfiles` alias. Example: `dotfiles diff` will show you the diff of the tracked changes. To commit the changes:

```
dotfiles add .bashrc
dotfiles commit -m "minor change to .bashrc"
```

3. Push the changes upstream
```
dotfiles push
```

### Note
if you want to add a new file to the dotfiles (and start tracking its changes), you can simply do
```
dotfiles add <currently untracked file>
``` 
and commit/push.
