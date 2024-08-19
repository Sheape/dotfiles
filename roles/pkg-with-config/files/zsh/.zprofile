#!/bin/zsh
# if ! timeout 1s xset q &>/dev/null; then
#     [[ "$(tty)" = "/dev/tty1" ]]; pgrep dwm || startx $XDG_CONFIG_HOME/X11/xinitrc
# fi

if ! timeout 1s xset q &>/dev/null; then
   [[ "$(tty)" = "/dev/tty1" ]]; pgrep dwm || sh $XDG_CONFIG_HOME/Wayland/winitrc
fi
