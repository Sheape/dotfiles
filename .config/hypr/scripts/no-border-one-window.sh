#!/bin/sh
eww_bar="bar" # Window name of your eww bar

set_border_size() {
    no_of_windows=$(hyprctl activeworkspace -j | jq .windows)
    swallow_window_state=$(hyprctl activewindow -j | jq .swallowing | grep -v '^null$')
    is_eww_bar_enabled=$(eww windows | grep "\*${eww_bar}")

    if  [ -n "$is_eww_bar_enabled" ]; then
        if [ "$no_of_windows" = 1 ] || { [ "$no_of_windows" -lt 3 ] && [ -n "$swallow_window_state" ]; }; then
            hyprctl --batch "keyword dwindle:no_gaps_when_only false; keyword general:border_size 0"
        else
            hyprctl keyword general:border_size 2
        fi
    elif [ "$no_of_windows" = 1 ] || { [ "$no_of_windows" -lt 3 ] && [ -n "$swallow_window_state" ]; }; then
        hyprctl keyword dwindle:no_gaps_when_only true
    else
        hyprctl keyword general:border_size 2
    fi
}

socat -u UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | while read -r line; do set_border_size; done
