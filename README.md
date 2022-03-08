# Dotfiles

## install scripts
brew
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

dein.vim
```sh
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
# For example, we just use `~/.cache/dein` as installation directory
sh ./installer.sh ~/.cache/dein
```

## symbolic link
neovim
```sh
ln -s ~/dotfiles/nvim ~/.config/nvim
```

vim
```sh
ln -s ~/dotfiles/vim/vimrc ~/.vimrc
```

