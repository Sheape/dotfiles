OLD_PWD := $(PWD)
PWD := $(CURDIR)
HOME_DOTFILES := system/home-dotfiles
VOID_VERSION := 20230628
VOID_PREREQUISITES := gum sfdisk wget xz
PACKAGE_LIST_DESKTOP := packages_desktop

.DEFAULT_GOAL := help

help: ## Prints help for targets with comments
	@cat $(MAKEFILE_LIST) | grep -E '^[a-zA-Z_-]+:.*?## .*$$' | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

init: ## Initialize and backup your configuration
	@for item in $(shell cat ${XDG_CONFIG_HOME}/$(HOME_DOTFILES)); do \
		if [ -n "$$(diff ${HOME}/$$item ${PWD}/$$item 2>/dev/null)" ] || [ ! -e ${PWD}/$$item ]; then \
			dir=$$(dirname ${PWD}/$$item); \
			if [ ! -d $$dir ]; then mkdir -p $$dir; fi; \
			cp -v ${HOME}/$$item ${PWD}/$$item; fi; \
	done

deploy: ## Deploy the configuration from local repo to home
	@for item in $(shell cat ${PWD}/$(HOME_DOTFILES)); do \
		diff_output=$$(diff ${HOME}/$$item ${PWD}/$$item); \
		if [ -n "$$diff_output" ]; then \
			dir=$$(dirname ${PWD}/$$item); \
			if [ ! -d $$dir ]; then mkdir -p $$dir; fi; \
			cp -v ${HOME}/$$item ${PWD}/$$item; \
		else \
			echo "No changes in ${HOME}/$$item"; fi; \
	done

diff: ## Check if there's a difference between local changes and local repo
	diff -r $(OLD_PWD) ${PWD}/$$(realpath --relative-to=${HOME} $(OLD_PWD))

filesystem: ## Setup partitions and btrfs filesystems to a drive
	$(eval DEVICE_SELECTED := $(shell gum choose $$(lsblk -nd -o NAME)))
	echo "Wiping filesystem"
	wipefs -a /dev/${DEVICE_SELECTED}
	./btrfs_setup.sh ${DEVICE_SELECTED}
	echo "Mounting filesystems"
	@if [ ! -d "/mnt" ]; then mkdir /mnt; fi
	mount /dev/${DEVICE_SELECTED}4 /mnt
	mkdir -p /mnt/boot/efi
	mount /dev/${DEVICE_SELECTED}1 /mnt/boot/efi
	echo "Downloading Void Linux tarball"
	wget https://repo-default.voidlinux.org/live/current/void-x86_64-ROOTFS-$(VOID_VERSION).tar.xz
	mv void-x86_64-ROOTFS-$(VOID_VERSION).tar.xz void_tarball.tar.xz
	tar xvf void_tarball.tar.xz -C /mnt
	rm -f void_tarball.tar.xz

void_base: filesystem ## Install void to a drive with all of the packages
	$(eval CHROOT = xchroot /mnt)
	echo "Chroot to void root"
	echo "Set hostname for this machine"
	$(eval hostname = $(shell gum input --placeholder "void-linux"))
	$(CHROOT) echo "${hostname}" > /etc/hostname
	echo "Setting hardware clock to UTC"
	$(CHROOT) echo 'HARDWARECLOCK="UTC"' > /etc/rc.conf
	echo "Setting keymap"
	$(CHROOT) echo "KEYMAP=us-workman" >> /etc/rc.conf
	echo "Set timezone"
	$(eval timezone_main = $(shell cat system/timezones | gum filter))
	$(eval timezone_secondary = $(shell ls -1 /usr/share/zoneinfo/${timezone_main} | gum filter))
	echo "Setting timezone"
	$(CHROOT) ln -svf /usr/share/zoneinfo/${timezone_main}/${timezone_secondary} /etc/localtime
	echo "Setting locale"
	$(CHROOT) echo LANG=en_US.UTF-8 > /etc/locale.conf
	echo "Set root password"
	$(CHROOT) passwd
	echo "Creating a new user account"
	echo "Username:"
	$(eval USERNAME = $(shell gum input))
	$(CHROOT) useradd -m -s /bin/bash $(USERNAME)
	echo "Password:"
	$(CHROOT) passwd $(USERNAME)
	$(CHROOT) usermod -a -G wheel,users,audio,video,cdrom,input $(USERNAME)
	echo "Enabling user to sudoers file"
	$(CHROOT) sed -i 's/^#%wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/' /etc/sudoers
	echo "Building /etc/fstab file"
	echo "Mounting /dev/${DEVICE_SELECTED}1 to /boot/efi"
	$(CHROOT) echo "UUID=$$(blkid --match-tag UUID --output value /dev/${DEVICE_SELECTED}1) /boot/efi vfat rw,relatime,fmask=0022,dmask=0022,codepage=437,iocharset=ascii,shortname=mixed,utf8,errors=remount-ro	0 2" > /etc/fstab
	echo "Mounting /dev/${DEVICE_SELECTED}2 as swap"
	$(CHROOT) echo "UUID=$$(blkid --match-tag UUID --output value /dev/${DEVICE_SELECTED}2) /boot/efi vfat rw,relatime,fmask=0022,dmask=0022,codepage=437,iocharset=ascii,shortname=mixed,utf8,errors=remount-ro	0 2" > /etc/fstab
	echo "Updating system"
	$(CHROOT) xbps-install -uy xbps
	$(CHROOT) xbps-install -Syu xbps
	$(CHROOT) xbps-install -uy
	$(CHROOT) xbps-install -Sy base-system
	$(CHROOT) xbps-remove -y base-voidstrap
	$(CHROOT) xbps-reconfigure -f glibc-locales
	# Updating mirrors and repo
	echo "Fetching mirrors"
	$(CHROOT) mkdir -p /etc/xbps.d
	$(CHROOT) cp /usr/share/xbps.d/*-repository-*.conf /etc/xbps.d/
	$(CHROOT) echo "repository=https://sheape.github.io/voidlings" > /etc/xbps.d/voidlings-repository-x86_64.conf
	$(CHROOT) xbps-install -Sy
	$(CHROOT) xbps-query -L

desktop_pkg: void_base ## Install the packages for desktop
	$(eval PACKAGES = sed -e '/^\s*#/d' -e '/^\s*$/d;' ${PACKAGE_LIST_DESKTOP} | sed -e ':a;N;$!ba;s/\n/ /g')
	$(CHROOT) xbps-install -Syu ${PACKAGES}

