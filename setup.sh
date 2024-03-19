#!/bin/bash

# function that checks folder or file existence returns true or false
is_exist() {
	[ -e $1 ] && return 0 || return 1
}

is_exist ~/.zshrc && echo "~/.zshrc is already exists" && exit
is_exist ~/.config/nvim && echo "~/.config/nvim folder is already exists" && exit
is_exist ~/.tmux && echo "~/.tmux is already exists" && exit
is_exist ~/.tmux.conf && echo "~/.tmux.conf is already exists" && exit

# if operating system is macos

if [[ $(uname) == "Darwin" ]]; then
	is_exist ~/.yabairc && echo "~/.yabairc is already exists" && exit
	is_exist ~/.config/skhd && echo "~/.config/skhd folder is already exists" && exit
fi

# create symbolic link source = ./.zshtc destination = ~/.zshrc
ln -s .zshrc ~/.zshrc
ln -s nvim ~/.config/nvim
ln -s .tmux ~/.tmux
ln -s .tmux.conf ~/.tmux.conf

if [[ $(uname) == "Darwin" ]]; then
	ln -s .yabairc ~/.yabairc
	ln -s skhd ~/.config/skhd
fi
