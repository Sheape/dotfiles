#!/usr/bin/env sh

DEVICE_SELECTED=$1

echo "Choose the drive you want to install Void Linux to:"
echo "Void Linux will be installed on /dev/${DEVICE_SELECTED}"

echo "Creating GPT Partition Table for /dev/${DEVICE_SELECTED}"
echo "label: gpt" | sfdisk /dev/"${DEVICE_SELECTED}"
echo "Set the partition size for /boot"
boot_size=$(gum input --placeholder 512M --value 512M)

echo "Set the partition size for swap"
swap_size=$(gum input --placeholder 8G --value 8G)

echo "Set the partition size for home"
home_size=$(gum input)

echo "Set the partition size for root"
root_size=$(gum input)

echo "Creating partitions"
sfdisk /dev/"${DEVICE_SELECTED}" << EOF
    ,${boot_size}, U;
    ,${swap_size}, S;
    ,${home_size}, L;
    ,${root_size}, L;
EOF
mkfs.vfat -n BOOT /dev/"${DEVICE_SELECTED}"1
mkswap -f -L SWAP /dev/"${DEVICE_SELECTED}"2
mkfs.btrfs -f -L HOME /dev/"${DEVICE_SELECTED}"3
mkfs.btrfs -f -L ROOT /dev/"${DEVICE_SELECTED}"4
