#!/bin/sh

get_interface() {
   ip addr show | awk '/inet.*brd/{print $NF; exit}'
}

check_state() {
    if [ "$(ls /sys/class/net/e* 2>/dev/null)" ]; then
        echo $(cat /sys/class/net/e*/operstate)' eth'
    elif [ "$(ls /sys/class/net/w* 2>/dev/null)" ]; then
        echo $(cat /sys/class/net/w*/operstate)' wifi';
    else
        echo 'not_connected'
    fi
}

# state() {
#     if [ get_interface() ==  ]; then
#         echo ""
#     fi
# }

case "$1" in
    get_interface) get_interface "$@";;
    check_state) check_state;;
esac
