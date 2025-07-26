if [[ -z "$ZELLIJ" ]]; then
    zellij attach workspace -c

    if [[ "$ZELLIJ_AUTO_EXIT" == "true" ]]; then
        exit
    fi
fi



if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH_CUSTOM="$HOME/.zsh-custom"
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-autosuggestions zsh-autocomplete zsh-syntax-highlighting zsh-you-should-use)

source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias mount="zellij attach workspace"
alias config="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias ed="nvim ."
alias ls="exa --color=always --icons -a"
alias rm="trash-put"
alias rml="trash-list"
alias bat="batcat"

# Path customization
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/root/.local/bin
export PATH=$PATH:$HOME/go/bin
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
export PATH="$PATH:/mnt/c/Tools"
export PATH="$PATH:/mnt/c/Windows/System32"
export PATH="$PATH:/mnt/c/Windows/System32/WindowsPowerShell/v1.0"

# Batcat configuration
export BAT_THEME="gruvbox-dark"

# Zoxide
eval "$(zoxide init --cmd cd zsh)"

# bun completions
[ -s "/root/.bun/_bun" ] && source "/root/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/root/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"



#Docker autostart
DOCKER_DISTRO="debian"
DOCKER_DIR=/mnt/wsl/shared-docker
DOCKER_SOCK="$DOCKER_DIR/docker.sock"
export DOCKER_HOST="unix://$DOCKER_SOCK"
if [ ! -S "$DOCKER_SOCK" ]; then
  mkdir -pm o=,ug=rwx "$DOCKER_DIR"
  chgrp docker "$DOCKER_DIR"
  /mnt/c/Windows/System32/wsl.exe -d $DOCKER_DISTRO sh -c "nohup sudo -b dockerd < /dev/null > $DOCKER_DIR/dockerd.log 2>&1"
fi
