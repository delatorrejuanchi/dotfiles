export ZSH="$HOME/.oh-my-zsh"

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
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zoxide
eval "$(zoxide init zsh)"

# starship
eval "$(starship init zsh)"

# gh copilot
eval "$(gh copilot alias -- zsh)"

# cabal
if [ -d "$HOME/.cabal/bin" ] ; then
    PATH="$HOME/.cabal/bin:$PATH"
fi

# ghcup
if [ -d "$HOME/.ghcup/bin" ] ; then
    PATH="$HOME/.ghcup/bin:$PATH"
fi
