default:

tmux:
	echo "source-file ~/dotfiles/tmux/.tmux.conf" >> ~/.tmux.conf

vim:
	echo "source ~/dotfiles/vim/vimrc" >> ~/.vimrc

neovim:
	echo "source ~/dotfiles/nvim/init.vim" >> ~/.config/nvim/init.vim

.PHONY: default tmux vim neovim
