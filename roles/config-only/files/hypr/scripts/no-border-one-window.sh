#!/bin/sh
eww_bar="bar" # Window name of your eww bar
shadow_color_one="0xff181825" # Shadow color if only one window is present
shadow_color_multiple="b4befecc" # Shadow color if multiple windows are in a workspace
cmd_one_window="keyword dwindle:no_gaps_when_only false; keyword general:border_size 0; keyword decoration:rounding 10;"
cmd_multiple_window="keyword general:border_size 3; keyword decoration:rounding 3;"

set_border_size() {
    no_of_windows=$(hyprctl activeworkspace -j | jq .windows)
    swallow_window_state=$(hyprctl activewindow -j | jq .swallowing | grep -v '^null$')
    is_eww_bar_enabled=$(eww windows | grep "\*${eww_bar}")

    if  [ -n "$is_eww_bar_enabled" ]; then
        if [ "$no_of_windows" = 1 ] || { [ "$no_of_windows" -lt 3 ] && [ -n "$swallow_window_state" ]; }; then
            hyprctl --batch "$cmd_one_window"
        else
            hyprctl --batch "$cmd_multiple_window"
        fi
    elif [ "$no_of_windows" = 1 ] || { [ "$no_of_windows" -lt 3 ] && [ -n "$swallow_window_state" ]; }; then
        hyprctl keyword dwindle:no_gaps_when_only true
    else
        hyprctl --batch "keyword general:border_size 3; keyword decoration:rounding 3"
    fi
}

socat -u UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | while read -r line; do set_border_size; done
