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
	echo "source ~/dotfiles/nvim/init.vim" >> ~/.config/nvim/init.vim

neovim_plugin:
	echo "source ~/dotfiles/nvim/light/init_plugin.vim" >> ~/.config/nvim/init.vim

starship:
	ln -s ~/dotfiles/starship/starship.toml ~/.config/starship.toml
	echo 'eval "$(starship init bash)"' >> ~/.bashrc

less:
	ln -s ~/dotfiles/less/.lesskey ~/.lesskey

fzf:
	echo "source /usr/share/doc/fzf/examples/key-bindings.bash" >> ~/.bashrc

install_starship:
	curl -sS https://starship.rs/install.sh | sh

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


.PHONY: default tmux vim neovim starship less
.PHONY: install_starship install_neovim install_packeges install_win32yank
