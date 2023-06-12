default:

tmux:
	echo "source-file ~/dotfiles/tmux/.tmux.conf" >> ~/.tmux.conf

vim:
	echo "source ~/dotfiles/vim/vimrc" >> ~/.vimrc

neovim:
	if [ ! -d ~/.config/nvim ]; then mkdir -p ~/.config/nvim; fi
	echo "source ~/dotfiles/nvim/init.vim" >> ~/.config/nvim/init.vim

starship:
	ln -s ~/dotfiles/starship/starship.toml ~/.config/starship.toml
	echo 'eval "$(starship init bash)"' >> ~/.bashrc

install_starship:
	curl -sS https://starship.rs/install.sh | sh

install_nvim:
	@if which nvim >/dev/null; then \
		echo "nvim is installed."; \
		exit 1; \
	fi
	sudo curl -L https://github.com/neovim/neovim/releases/latest/download/nvim.appimage -o /usr/local/bin/nvim
	sudo chmod +x /usr/local/bin/nvim



.PHONY: default tmux vim neovim starship
.PHONY: install_starship install_nvim
