#!/bin/zsh
# if ! timeout 1s xset q &>/dev/null; then
#     [[ "$(tty)" = "/dev/tty1" ]]; pgrep dwm || startx $XDG_CONFIG_HOME/X11/xinitrc
# fi

# if ! timeout 1s xset q &>/dev/null; then
#    [[ "$(tty)" = "/dev/tty1" ]]; pgrep dwm || sh $HOME/.config/Wayland/winitrc
# fi

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec ~/.config/Wayland/winitrc
fi
