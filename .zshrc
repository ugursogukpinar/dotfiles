
# if not running interactively do nothing.
#
[[ $- != *i* ]] && return


if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux new-session -A -s main
fi

# If you come from bash you might have to change your $PATH.


# Only run on macOS

if [[ "$OSTYPE" == "darwin"* ]]; then
  # needed for brew
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi



# env variables
export VISUAL=nvim
export EDITOR=nvim
export XDG_CONFIG_HOME="$HOME"/.config
export PATH=$HOME/bin:/usr/local/bin:$HOME/go/bin:/Applications/kitty.app/Contents/MacOS:$PATH
export GOPATH=$HOME/go
export DOCKER_SOCK=/var/run/docker.sock
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
export VIRTUAL_ENV_DISABLE_PROMPT=1
export CLOUDSDK_PYTHON=`which python3`


# Oh My ZSH Setup
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME=""
plugins=(git zoxide tmux tmuxinator fzf)
source $ZSH/oh-my-zsh.sh


alias q="z";
alias m="tmuxinator";
alias mux="tmuxinator";

alias dpostgres="docker run -it --rm --name postgres11 -v ~/volumes/postgres:/var/lib/postgresql/data -p 54320:5432 -e POSTGRES_PASSWORD=postgres postgres:11"
alias dmongo="docker run -it --rm --name mongo -v ~/volumes/mongo:/data/db -p 27017:27017 mongo"
alias dsqledge="docker run -it --rm --name sqledge -v ~/volumes/sqledge:/var/opt/mssql/data --cap-add SYS_PTRACE -e 'ACCEPT_EULA=1' -e 'MSSQL_SA_PASSWORD=bigStrongPwd123' -p 1433:1433 mcr.microsoft.com/azure-sql-edge"
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
alias sgblogs="cd /Users/ugursogukpinar/works/SmartGift/code/sgb-workspace/sgb-backend-local-dev && docker compose --env-file .env.docker-compose logs -f";



devtunnel() { cloudflared tunnel --config $HOME/.cloudflared/config.yml --url $1 run dev; }

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ugursogukpinar/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ugursogukpinar/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ugursogukpinar/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ugursogukpinar/google-cloud-sdk/completion.zsh.inc'; fi
# kubectl autocomplete
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

source /Users/ugursogukpinar/.docker/init-zsh.sh || true # Added by Docker Desktop


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Startship setup
eval "$(starship init zsh)"

# Remove conda base identifier
# PROMPT=$(echo $PROMPT | sed 's/(base) //')


