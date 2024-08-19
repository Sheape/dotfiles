#!/bin/sh

# Check if the script was ran with root permissions
if [ "$(id -u)" -ne 0 ]; then
	echo "This script must be run with root."
	exit 1
fi

cp ansible-install.sh /mnt/tmp
xchroot /mnt /tmp/ansible-install.sh
