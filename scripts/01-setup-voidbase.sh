#!/bin/sh

# Check if the script was ran with root permissions
if [ "$(id -u)" -ne 0 ]; then
	echo "This script must be run with root."
	exit 1
fi

device_selected_file=$HOME/.cache/device_selected

if [ ! -e "$device_selected_file" ]; then
	echo "Run the setup fs script first before proceeding."
	exit 1
fi

device_selected="$(cat $device_selected_file)"
tarball_installed_path="$HOME/.cache/tarball_installed"
void_version="20240314"
echo "Hostname: "
read hostname
echo "Timezone (eg. Asia/Manila): "
read timezone
echo "Username: "
read username
echo "Root password: "
read root_passwd
echo "${username} password: "
read user_passwd

cat << EOF > void-config
HOSTNAME=$hostname
TIMEZONE=$timezone
USERNAME=$username
DEVICE_SELECTED=$device_selected
ROOT_PASSWORD=$root_passwd
USER_PASSWORD=$user_passwd
EOF

mount_root() {
	if [ ! -d "/mnt" ]; then mkdir /mnt; fi
	mount /dev/${device_selected}4 /mnt
}

install_tarball() {
	echo "Downloading Void Linux tarball"
	filename=void-x86_64-ROOTFS-${void_version}.tar.xz
	tarball_url=https://repo-default.voidlinux.org/live/current/${filename}

	wget ${tarball_url}
	mv ${filename} void_tarball.tar.xz
	tar xvf void_tarball.tar.xz -C /mnt
	rm -f void_tarball.tar.xz
	echo "1" > $HOME/.cache/tarball_installed
}

mount_fs() {
	if [ ! -d "/mnt/home" ]; then mkdir -p /mnt/home; fi
	mount /dev/${device_selected}3 /mnt/home
	if [ ! -d "/mnt/boot/efi" ]; then mkdir -p /mnt/boot/efi; fi
	mount /dev/${device_selected}1 /mnt/boot/efi
}

install_voidbase() {
	cp base-install.sh /mnt/tmp
	chmod +x /mnt/tmp/base-install.sh
	mv scripts/void-config /mnt/tmp
	xchroot /mnt /tmp/base-install.sh
	rm /mnt/tmp/base-install.sh /mnt/tmp/void-config
}


mount_root

if [ ! -e "$tarball_installed_path" ]; then
	install_tarball
	echo "1" > $tarball_installed_path
fi

mount_fs
install_voidbase
