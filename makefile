default:

tmux:
	@if [ ! -d ~/.config/tmux ]; then \
		mkdir -p ~/.config/tmux; \
	fi
	echo "source-file ~/dotfiles/tmux/tmux.conf" >> ~/.config/tmux/tmux.conf

vim:
	@if [ ! -d ~/.vim ]; then \
		mkdir -p ~/.vim; \
	fi
	echo "source ~/dotfiles/vim/vimrc" >> ~/.vim/vimrc

vim_plugin:
	echo "source ~/dotfiles/vim/plugins.vim" >> ~/.vim/vimrc

neovim:
	@if [ ! -d ~/.config/nvim ]; then \
		mkdir -p ~/.config/nvim; \
	fi
	echo 'dofile(vim.fn.expand("~/dotfiles/nvim/init.lua"))' >> ~/.config/nvim/init.lua

less:
	ln -s ~/dotfiles/less/.lesskey ~/.lesskey

update_neovim:
	sudo rm -rf /opt/nvim-linux-x86_64
	curl -L https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.tar.gz | sudo tar xz -C /opt
	nvim --version | head -1

.PHONY: default tmux vim neovim less update_neovim
