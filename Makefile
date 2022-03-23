usage:
	@echo "Enter 'make all' to create a symbolic link."

all: clear neovim vim tmux

clear:
	unlink ~/.vimrc
	unlink ~/.tmux.conf
	unlink ~/.config/nvim

neovim:
	mkdir -p ~/.config && ln -s ~/dotfiles/nvim ~/.config

vim:
	ln -s ~/dotfiles/vim/vimrc ~/.vimrc

tmux:
	ln -s ~/dotfiles/.tmux.conf ~
