#!/bin/sh

# Check if the script was ran with root permissions
if [ "$(id -u)" -ne 0 ]; then
	echo "This script must be run with root."
	exit 1
fi

device_selected_file="$HOME/.cache/device_selected"
if [ -e "$device_selected_file" ]; then
	exit 0
fi

# Ask for the user which device to nuke
echo "Enter the device (eg. sda) that you want to NUKE and install void linux to:"
read device_selected

echo $device_selected > $device_selected_file

echo "Enter the partition size for boot partition: /boot (eg. 512M): "
read boot_partition_size

echo "Enter the partition size for swap partition (eg. 8G): "
read swap_partition_size

echo "Enter the partition size for home partition: "
read home_partition_size 

echo "Enter the partition size for root partition: "
read root_partition_size

echo "Securly erasing device (SATA SSD) /dev/${device_selected}"
hdparm --security-erase NULL /dev/${device_selected}

echo "Wiping filesystem from /dev/${device_selected}"
wipefs -a /dev/${device_selected}
echo "Void Linux will be installed on /dev/${device_selected}"
echo "Creating GPT Partition Table on /dev/${device_selected}"
echo "label: gpt" | sfdisk /dev/${device_selected}

echo "Creating partitions for boot, swap, home, and root"
sfdisk /dev/${device_selected} << EOF
	,${boot_partition_size}, U;
	,${swap_partition_size}, S;
	,${home_partition_size}, L;
	,${root_partition_size}, L;
EOF

mkfs.vfat -n BOOT /dev/${device_selected}1
mkswap -f -L SWAP /dev/${device_selected}2
mkfs.btrfs -f -L HOME /dev/${device_selected}3
mkfs.btrfs -f -L ROOT /dev/${device_selected}4