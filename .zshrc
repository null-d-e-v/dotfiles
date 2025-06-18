if [[ -z "$ZELLIJ" ]]; then
    zellij attach workspace -c

    if [[ "$ZELLIJ_AUTO_EXIT" == "true" ]]; then
        exit
    fi
fi

alias mount="zellij attach workspace"


if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting you-should-use)

source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias config="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias ed="nvim ."
alias ls="exa --color=always --icons -a"
alias rm="trash-put"
alias rml="trash-list"
alias bat="batcat"

# Path customization
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
export PATH="$PATH:/mnt/c/Tools"

# Batcat configuration
export BAT_THEME="Catppuccin Mocha"


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


nvim() {
    if ! pidof socat > /dev/null 2>&1; then
        [ -e /tmp/discord-ipc-0 ] && rm -f /tmp/discord-ipc-0
        socat UNIX-LISTEN:/tmp/discord-ipc-0,fork \
            EXEC:"npiperelay.exe //./pipe/discord-ipc-0" 2>/dev/null &
    fi

    if [ $# -eq 0 ]; then
        command nvim
    else
        command nvim "$@"
    fi
}
