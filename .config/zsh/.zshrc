# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Sourcing other files
source $ZDOTDIR/functions
source $ZDOTDIR/alias
if [[ -n "$_START_LFCD" ]]; then
    unset _START_LFCD
    lfcd
fi

# Colors and prompt
autoload -U colors && colors
PS1="%B%{$fg[red]%}%{$fg[yellow]%}%~ %b "

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
source $plugins/zsh-powerlevel10k/powerlevel10k.zsh-theme

eval "$(lua ${plugins}/zsh-zlua/z.lua --init zsh enhanced once fzf)"
# Terminal-specific keybindings
## Lf
#bindkey -s '^o' 'lfcd\n'

# Starship
## Fixes the bug, if a pre-configured theme is already selected, starship doesn't apply
#autoload -Uz promptinit
#promptinit
#prompt off

#eval "$(starship init zsh)"
#POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
