export ZSH="/Users/foldesizsombor/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# Install plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Set bash completion + fzf
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Install fzf-dbt - a command line finder for dbt models
FZF_DBT_PATH=~/.fzf-dbt/fzf-dbt.sh
if [[ ! -f $FZF_DBT_PATH ]]; then
    FZF_DBT_DIR=$(dirname $FZF_DBT_PATH)
    print -P "%F{green}Installing fzf-dbt into $FZF_DBT_DIR%f"
    mkdir -p $FZF_DBT_DIR
    command curl -L https://raw.githubusercontent.com/Infused-Insight/fzf-dbt/main/src/fzf_dbt.sh > $FZF_DBT_PATH && \
        print -P "%F{green}Installation successful.%f" || \
        print -P "%F{red}The download has failed.%f"
fi

export FZF_DBT_PREVIEW_CMD="cat {}"
export FZF_DBT_HEIGHT=80%
source $FZF_DBT_PATH

# add function to run changed dbt models in a repo
function dbt_run_changed() {
    children=$1
    models=$(git diff --name-only | grep '\.sql$' | awk -F '/' '{ print $NF }' | sed "s/\.sql$/${children}/g" | tr '\n' ' ')
    echo "Running models: ${models}"
    dbt run --models $models
}

# Setup common shortcuts
alias ky='glow /Users/foldesizsombor/.keyboard.md' # Glow is a terminal markdown renderer
alias python=python3
alias pip=pip3

# shortcut for frequently used git command
# open github repos from terminal
alias ogh="open `git remote -v | grep fetch | awk '{print $2}' | sed 's/git@/http:\/\//' | sed 's/com:/com\//'`| head -n1"
alias gpull='git pull origin $(git rev-parse --abbrev-ref HEAD)'
alias gpush='git push origin HEAD'
alias gc="git clone"
alias gs="git switch"
alias gr="git rebase"
alias vim='nvim'
alias cat='bat'

# Dev machine aliases

# Azure local setups to enable Azure CLI for multiple tenant
alias az_euc='export AZURE_CONFIG_DIR=~/.Azure-EUC'
alias az_hf='export AZURE_CONFIG_DIR=~/.Azure'
alias az_phoenix='export AZURE_CONFIG_DIR=~/.Azure-Phoenix'

alias activate="source .venv/bin/activate"