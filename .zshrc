export ZSH="$HOME/.oh-my-zsh"
export XDG_CONFIG_HOME="$HOME/.config"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    gh
)

source $ZSH/oh-my-zsh.sh

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# neovim
export EDITOR='nvim'
alias vi="nvim"
alias vim="nvim"

# fzf
eval "$(fzf --zsh)"

# zoxide
eval "$(zoxide init zsh)"

# starship
eval "$(starship init zsh)"

# cabal
if [ -d "$HOME/.cabal/bin" ] ; then
    PATH="$HOME/.cabal/bin:$PATH"
fi

# ghcup
if [ -d "$HOME/.ghcup/bin" ] ; then
    PATH="$HOME/.ghcup/bin:$PATH"
fi

# pyenv
if [ -d "$HOME/.pyenv" ] ; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
fi
