#!/bin/bash

set -e

if [ ${EUID:-${UID}} = 0 ]; then
    echo 'Your is super user.'
    echo 'Please change general user.'
    exit
fi

#
# apt package
#

sudo apt update -y 
sudo apt upgrade -y

#
# Requirement
#

if !(which gcc > /dev/null 2>&1); then
    sudo apt install -y build-essential
fi

if !(which curl > /dev/null 2>&1); then
    sudo apt install -y curl
fi

if !(which git > /dev/null 2>&1); then
    sudo apt install -y git
fi

#
# Clone repository
#

if [ ! -d ~/dotfiles ]; then
    cd $HOME
    git clone https://github.com/Lttce/dotfiles.git
fi

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

