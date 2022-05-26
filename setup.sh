#!/bin/bash

set -e

#
# apt package
#

sudo apt update -y 
sudo apt upgrade -y

sudo apt install build-essential -y

#
# Homebrew
#

if !(which brew > /dev/null 2>&1); then
    NONINTERACTIVE=1
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/$USER/.profile
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

if [ -e ~/dotfiles/brew/Brewfile ]; then
    brew bundle --file ~/dotfiles/brew/Brewfile
fi

#
# Symbolic links
#

if [ -d ~/dotfiles ]; then
    if [ ! -d ~/.config ]; then
        mkdir -p ~/.config
    fi

    if [ ! -L ~/.config/nvim ]; then
        ln -s ~/dotfiles/nvim ~/.config
    fi

    if [ ! -L ~/vim/.vimrc ]; then
        ln -s ~/dotfiles/vim/vimrc ~/.vimrc
    fi

    if [ ! -L ~/tmux/.tmux.conf ]; then
        ln -s ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
    fi
fi

# relogin shell
exec $SHELL -l

