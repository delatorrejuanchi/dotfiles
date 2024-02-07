# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export ZSH="$HOME/.oh-my-zsh"
export LANG=en_US.UTF-8
export EDITOR='nvim'

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git
  zsh-autosuggestions
  zsh-syntax-highlighting
  gh
)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# golang
if [ -d "/usr/local/go" ] ; then
  export PATH="/usr/local/go/bin:$PATH"
fi

# Neovim
alias vi="nvim"
alias vim="nvim"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zoxide
eval "$(zoxide init zsh)"

# terminfo for colors
export TERMINFO_DIRS=$TERMINFO_DIRS:$HOME/.local/share/terminfo

