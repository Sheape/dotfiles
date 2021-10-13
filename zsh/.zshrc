# Created by newuser for 5.8

# Enable colors on startup
autoload -U colors && colors

# PATH
export PATH="$PATH:$HOME/bin:$HOME/.local/bin:/usr/local/bin:$HOME/.emacs.d/bin:$HOME/bin"

# History
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.cache/zsh/history
setopt SHARE_HISTORY

# Other Global Variables
export EDITOR=nvim

# Alias
source ~/.config/zsh/.aliasrc

# Zsh Syntax Highlighting, Auto-completion, Auto-suggestions, etc.
source /usr/share/zsh/plugins/zsh-auto-tab/zsh-auto-tab.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.zsh

# Autorun
pfetch

# To fix the problem with using tab completion duplicating.
# localectl set-locale LANG=en_US.UTF-8

# Starship
eval "$(starship init zsh)"
export STARSHIP_CACHE=~/.cache/starship/cache
