export ZSH="/home/ugursogukpinar/.oh-my-zsh"
export GOPATH=$HOME/go
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$GOPATH/bin:$PATH
export LANG=en_US.UTF-8
export VISUAL="vim"
export TERM=xterm-256color
export GTK1_RC_FILES=~/.config/gtk-3.0/gtkrc
export XDG_DATA_DIRS=/usr/share/:/usr/local/share/:/var/lib/snapd/desktop


export XKB_DEFAULT_LAYOUT=us

if [ $(tty) = "/dev/tty1" ]; then
    eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
    export SSH_AUTH_SOCK
	# export XDG_CURRENT_DESKTOP=Unity
	export XDG_CURRENT_DESKTOP=sway
	export CLUTTER_BACKEND=wayland 
	export XDG_SESSION_TYPE=wayland
	# export GDK_BACKEND=wayland
	# export QT_QPA_PLATFORM=wayland
    export MOZ_ENABLE_WAYLAND=1
		
	export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
	export QT_WAYLAND_FORCE_DPI=physical
	export ECORE_EVAS_EVAS_ENGINE=wayland_egl
	export ELM_ENGINE=wayland_egl
	export SDL_VIDEODRIVER=wayland
	export _JAVA_AWT_WM_NONREPARENTING=1

	sway
	exit 0
fi


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi



ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
	archlinux docker git rsync sudo systemd
	)


source $ZSH/oh-my-zsh.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

