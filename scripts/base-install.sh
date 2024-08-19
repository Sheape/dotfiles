#!/bin/sh

. /tmp/void-config

echo "Updating system"
xbps-install -Syu xbps
xbps-install -yu
xbps-install -y base-system
xbps-remove -y base-container-full

echo "Setting hostname"
echo $HOSTNAME > /etc/hostname

echo "Setting hardware clock to UTC"
echo 'HARDWARECLOCK="UTC"' > /etc/rc.conf

echo "Setting the default keyboard layout to us-workman (term)"
echo 'KEYMAP="us-workman"' >> /etc/rc.conf

echo "Changing timezone to ${TIMEZONE}"
ln -svf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime

echo "Setting root password"
echo "root:${ROOT_PASSWD}" | chpasswd

echo "Adding user ${USERNAME}"
useradd -m -s /bin/bash ${USERNAME}
usermod -a -G wheel,users,audio,video,cdrom,input ${USERNAME}

echo "Setting user password"
echo "${USERNAME}:${USER_PASSWD}" | chpasswd

echo "Enabling all users for sudo in sudoers file"
sed -i 's/^# %wheel ALL=(ALL:ALL) ALL/s/^# //' /etc/sudoers

echo "Building /etc/fstab file"
echo "Mounting /dev/${DEVICE_SELECTED}1 to /boot/efi"
echo "UUID=$(blkid --match-tag UUID --output value /dev/${DEVICE_SELECTED}1) /boot/efi vfat rw,relatime,fmask=0022,dmask=0022,codepage=437,iocharset=ascii,shortname=mixed,utf8,errors=remount-ro	0 2" > /etc/fstab

echo "Mounting /dev/${DEVICE_SELECTED}2 as swap"
echo "UUID=$(blkid --match-tag UUID --output value /dev/${DEVICE_SELECTED}2) swap swap rw,noatime,discard 0 0" >> /etc/fstab

echo "Mounting /dev/${DEVICE_SELECTED}3 as /home"
echo "UUID=$(blkid --match-tag UUID --output value /dev/${DEVICE_SELECTED}3) /home btrfs rw,noatime,ssd,compress=zstd,space_cache=v2,commit=120	0 2" >> /etc/fstab

echo "Mounting /dev/${DEVICE_SELECTED}4 as /"
echo "UUID=$(blkid --match-tag UUID --output value /dev/${DEVICE_SELECTED}4) / btrfs rw,noatime,ssd,compress=zstd,space_cache=v2,commit=120	0 2" >> /etc/fstab

echo "Mounting /tmp to memory"
echo "tmpfs /tmp tmpfs defaults,nosuid,nodev 0 0"

echo "Changing locale"
sed -i '/^#en_US.UTF-8 UTF-8/s/^#//' /etc/default/libc-locales
xbps-reconfigure -f glibc-locales


echo "Setting up grub for x86-64 system"
xbps-install -Sy grub-x86_64-efi
grub-install --target=x86_64-efi --efi-directory=/boot/efi -- bootloader-id="Void"

echo "Installing zsh, bash and dash"
xbps-install -Sy zsh bash dash

echo "Changing default shell to zsh"
chsh -s /usr/bin/zsh ${USERNAME}
chsh -s /usr/bin/zsh root

# echo "Linking dash to sh"
# ln -s /usr/bin/dash /usr/bin/sh

xbps-reconfigure -fa
