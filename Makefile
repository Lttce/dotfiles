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

install_starship:
	curl -sS https://starship.rs/install.sh | sh


.PHONY: default tmux vim neovim starship
.PHONY: install_starship
