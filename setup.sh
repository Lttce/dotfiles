#!/bin/bash

set -e

#
# apt package
#

sudo apt update -y 
sudo apt upgrade -y

sudo apt install build-essential -y

#
# Requirement
#

if !(which curl> /dev/null 2>&1); then
    sudo apt install -y curl
fi

if !(which git > /dev/null 2>&1); then
    sudo apt install -y git
fi

#
# Clone repository
#

git clone https://github.com/Lttce/dotfiles.git

#
# Homebrew
#

if !(which brew > /dev/null 2>&1); then
    export NONINTERACTIVE=1
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/$USER/.profile
    source /home/$USER/.profile
fi

if [ -e ~/dotfiles/brew/Brewfile ]; then
    brew bundle --file ~/dotfiles/brew/Brewfile
fi

#
# Symbolic links
#

if [ ! -d ~/.config ]; then
    mkdir -p ~/.config
fi

if [ ! -L ~/.config/nvim ]; then
    ln -s ~/dotfiles/nvim ~/.config
fi

if [ ! -L ~/.vimrc ]; then
    ln -s ~/dotfiles/vim/vimrc ~/.vimrc
fi

if [ ! -L ~/.tmux.conf ]; then
    ln -s ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
fi

