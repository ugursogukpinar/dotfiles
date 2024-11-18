

# env variables
export VISUAL=nvim
export EDITOR=nvim
export XDG_CONFIG_HOME="$HOME"/.config

export PATH=$HOME/bin:/usr/local/bin:$HOME/go/bin:/Applications/kitty.app/Contents/MacOS:$PATH
export PATH=$PATH:/opt/flutter/flutter/bin
export PATH="$PATH:/Users/ugursogukpinar/.local/bin"

export GOPATH=$HOME/go
# export DOCKER_SOCK=/var/run/docker.sock
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
export VIRTUAL_ENV_DISABLE_PROMPT=1
export CLOUDSDK_PYTHON=`which python3`
export LANG=en
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

# Oh My ZSH Setup
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME=""
plugins=(git zoxide tmux tmuxinator fzf golang)
source $ZSH/oh-my-zsh.sh



export NVM_DIR="$HOME/.nvm"
    [ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" # This loads nvm
    [ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion


alias q="z";
alias m="tmuxinator";
alias mux="tmuxinator";

alias dpostgres="docker run -it --rm --name postgres11 -v ~/volumes/postgres:/var/lib/postgresql/data -p 54320:5432 -e POSTGRES_PASSWORD=postgres postgres:11"
alias dmongo="docker run -it --rm --name mongo -v ~/volumes/mongo:/data/db -p 27017:27017 mongo"
alias dsqledge="docker run -it --rm --name sqledge -v ~/volumes/sqledge:/var/opt/mssql/data --cap-add SYS_PTRACE -e 'ACCEPT_EULA=1' -e 'MSSQL_SA_PASSWORD=bigStrongPwd123' -p 1433:1433 mcr.microsoft.com/mssql/server"
alias dminio="docker run -it --rm -p 9000:9000 -p 9001:9001 --name minio -v ~/volumes/minio:/data -e 'MINIO_ROOT_USER=admin' -e 'MINIO_ROOT_PASSWORD=123qweASD' quay.io/minio/minio server /data --console-address ':9001'"
alias cdw="cd ~/works"
alias cdsgb="cd ~/works/SmartGift/code/sgb-workspace"

alias upgrade_yabai="bash ~/.config/scripts/upgrade_yabai.sh"

# Git shortcuts
alias g=git
alias ga='git add'
alias gaa='git add --all'
alias gcb='git checkout -b'
alias gcm='git checkout master'
alias gcmsg='git commit -m'
alias gco='git checkout'
alias gd='git diff'
alias gl='git pull'
alias gm='git merge'
alias gp='git push'
alias grev='git revert'
alias gss='git status -s'
alias git-clean-local='git branch --merged | egrep -v "(^\*|master|main|uat|development)" | xargs git branch -d'
alias gcrev='git rev-parse HEAD | head -c8 | pbcopy'

# Tmux and vim
alias t="tmux new-session -A -s main"
alias v="nvim"
alias vim="nvim"


# sgb
alias sgbup="cd /Users/ugursogukpinar/works/SmartGift/code/sgb-workspace/sgb-backend-local-dev && docker compose --env-file .env.docker-compose up --build -d && cd -";
alias sgbdown="cd /Users/ugursogukpinar/works/SmartGift/code/sgb-workspace/sgb-backend-local-dev && docker compose --env-file .env.docker-compose down && cd -";
alias sgblogs="cd /Users/ugursogukpinar/works/SmartGift/code/sgb-workspace/sgb-backend-local-dev && docker compose --env-file .env.docker-compose logs -f sgb";



function logg() {
    git log | fzf --ansi --no-sort \
        --preview 'echo {} | grep -o "[a-f0-9]\{7\}" | head -1 | xargs -I % git show % --color=always' \
        --preview-window=right:50%:wrap --height 100% \
        --bind 'enter:execute(echo {} | grep -o "[a-f0-9]\{7\}" | head -1 | xargs -I % sh -c "git show % | nvim -c \"setlocal buftype=nofile bufhidden=wipe noswapfile nowrap\" -c \"nnoremap <buffer> q :q!<CR>\" -")' \
        --bind 'ctrl-e:execute(echo {} | grep -o "[a-f0-9]\{7\}" | head -1 | xargs -I % sh -c "gh browse %")'
}




if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
 exec tmux new-session -A -s main
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ugursogukpinar/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ugursogukpinar/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ugursogukpinar/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ugursogukpinar/google-cloud-sdk/completion.zsh.inc'; fi
