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
ln -s $(pwd)/.zshrc ~/.zshrc
ln -s $(pwd)/nvim ~/.config/nvim
ln -s $(pwd)/.tmux ~/.tmux
ln -s $(pwd)/.tmux.conf ~/.tmux.conf

if [[ $(uname) == "Darwin" ]]; then
	ln -s $(pwd)/.yabairc ~/.yabairc
	ln -s $(pwd)/skhd ~/.config/skhd
fi

# get current file directory
