#
# setup Makefile
#
usage:
	@echo "Enter 'make link' to create a symbolic links."
	@echo "Enter 'make install' to install applications."

all: link install

link: neovim vim tmux

clear:
	unlink ~/.vimrc
	unlink ~/.tmux.conf
	unlink ~/.config/nvim

install: brew

#
# symbolic links
#
neovim:
	mkdir -p ~/.config && ln -s ~/dotfiles/nvim ~/.config

vim:
	ln -s ~/dotfiles/vim/vimrc ~/.vimrc

tmux:
	ln -s ~/dotfiles/.tmux.conf ~

#
# applications
#
brew:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# FROM: https://github.com/neovim/neovim/wiki/FAQ#how-to-use-the-windows-clipboard-from-wsl
neovim_clipboard:
	curl -sLo/tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
	unzip -p /tmp/win32yank.zip win32yank.exe > /tmp/win32yank.exe
	chmod +x /tmp/win32yank.exe
	sudo mv /tmp/win32yank.exe /usr/local/bin/

