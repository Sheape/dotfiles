# Importing other files
source $ZDOTDIR/alias
source $ZDOTDIR/functions

# Variables for this file only
plugins="/usr/share/zsh/plugins"

# Enable colors on startup
autoload -U colors && colors

# History
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE="$XDG_CACHE_HOME/zsh/history"
setopt SHARE_HISTORY

zstyle ':completion:*' cache-path $XDG_CACHE_HOME/zsh/zcompcache

# Zsh Plugins
source $plugins/zsh-auto-tab/zsh-auto-tab.zsh
source $plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $plugins/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $plugins/zsh-vi-mode/zsh-vi-mode.zsh

# Terminal-specific keybindings
## Lf
bindkey -s '^o' 'lfcd\n'

# Starship
## Fixes the bug, if a pre-configured theme is already selected, starship doesn't apply
autoload -Uz promptinit
promptinit
prompt off

#eval "$(starship init zsh)"
