#!/bin/bash

install_vim_config() {
	echo "Copying $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/.vimrc to ~"
	cp $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/.vimrc ~/.vimrc
	echo "Vim configuration copied"
}

install_vim_git_gutter() {
	echo "Installing GitGutter plugin for Vim"
	mkdir -p ~/.vim/pack/airblade/start
	git clone https://github.com/airblade/vim-gitgutter.git ~/.vim/pack/airblade/start/vim-gitgutter
	vim -u NONE -c "helptags ~/.vim/pack/airblade/start/vim-gitgutter/doc" -c q
	echo "GitGutter plugin installed successfully"
}

install_vim_nerdtree() {
	echo "Installing NerdTree plugin for Vim"
	mkdir -p ~/.vim/pack/preservim/start
	git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
	vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q
}

install_vim_config
install_vim_git_gutter
install_vim_nerdtree
