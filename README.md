# Dotfiles

## Install scripts
brew
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

dein.vim
```sh
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
```

## Symbolic link
neovim
```sh
ln -s ~/dotfiles/nvim ~/.config/nvim
```

vim
```sh
ln -s ~/dotfiles/vim/vimrc ~/.vimrc
```

<<<<<<< HEAD
tmux
```sh
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
tmux source ~/.tmux.conf
=======
## Windows subsystem for Linux
use clipboard in neovim
```sh
curl -sLo/tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
unzip -p /tmp/win32yank.zip win32yank.exe > /tmp/win32yank.exe
chmod +x /tmp/win32yank.exe
sudo mv /tmp/win32yank.exe /usr/local/bin/
# FROM: https://github.com/neovim/neovim/wiki/FAQ#how-to-use-the-windows-clipboard-from-wsl
>>>>>>> Update
```