export XDG_CONFIG_HOME="$HOME/.config"

[[ ! -r "$HOME/.local/bin/env" ]] || source "$HOME/.local/bin/env"

# fzf
command -v fzf >/dev/null 2>&1 && eval "$(fzf --zsh)"

# zoxide
command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init zsh)"

# mise
command -v mise >/dev/null 2>&1 && eval "$(mise activate)"

# compinit
autoload -U compinit; compinit

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
