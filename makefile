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

install_neovim:
	@if which nvim >/dev/null; then \
		echo "nvim is installed."; \
		exit 1; \
	fi
	sudo curl -L https://github.com/neovim/neovim/releases/latest/download/nvim.appimage -o /usr/local/bin/nvim
	sudo chmod +x /usr/local/bin/nvim

uninstall_neovim:
	sudo rm /usr/local/bin/nvim

update_neovim:
	sudo rm -rf /opt/nvim-linux-x86_64
	curl -L https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.tar.gz | sudo tar xz -C /opt
	nvim --version | head -1

install_win32yank:
	sudo curl -L https://github.com/equalsraf/win32yank/releases/latest/download/win32yank-x64.zip -o /usr/local/bin/win32yank.zip \
		&& sudo unzip -o -d /usr/local/bin /usr/local/bin/win32yank.zip \
		&& sudo rm /usr/local/bin/win32yank.zip /usr/local/bin/LICENSE /usr/local/bin/README.md \
		&& sudo chmod +x /usr/local/bin/win32yank.exe


.PHONY: default tmux vim neovim less
.PHONY: install_neovim uninstall_neovim update_neovim install_win32yank
