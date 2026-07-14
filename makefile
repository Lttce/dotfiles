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

fzf:
	echo "source /usr/share/doc/fzf/examples/key-bindings.bash" >> ~/.bashrc

install_neovim:
	@if which nvim >/dev/null; then \
		echo "nvim is installed."; \
		exit 1; \
	fi
	sudo curl -L https://github.com/neovim/neovim/releases/latest/download/nvim.appimage -o /usr/local/bin/nvim
	sudo chmod +x /usr/local/bin/nvim

uninstall_neovim:
	sudo rm /usr/local/bin/nvim

install_packeges:
	sudo apt install -y \
		build-essential \
		git \
		curl \
		tree \
		tmux \
		fzf \
		libfuse2

install_win32yank:
	sudo curl -L https://github.com/equalsraf/win32yank/releases/latest/download/win32yank-x64.zip -o /usr/local/bin/win32yank.zip \
		&& sudo unzip -o -d /usr/local/bin /usr/local/bin/win32yank.zip \
		&& sudo rm /usr/local/bin/win32yank.zip /usr/local/bin/LICENSE /usr/local/bin/README.md \
		&& sudo chmod +x /usr/local/bin/win32yank.exe


.PHONY: default tmux vim neovim less
.PHONY: install_neovim install_packeges install_win32yank
