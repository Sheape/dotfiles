#!/bin/sh

USERNAME=$(awk -F: '$6 ~ /^\/home/ { print $1 }' /etc/passwd)

echo "Installing Ansible and Git"
xbps-install -Sy ansible git

echo "Cloning dotfiles repo"
sudo -u $USERNAME mkdir -v /home/${USERNAME}/code
sudo -u $USERNAME git clone https://github.com/Sheape/dotfiles.git /home/${USERNAME}/code/dotfiles

echo "Password for Ansible-vault: "
read ansible_vault_passwd

echo "Running Ansible playbook"
sudo -u $USERNAME ansible-playbook -K /home/${USERNAME}/code/dotfiles/ansible/playbook.yml --vault-password-file <(echo $ansible_vault_passwd) /home/${USERNAME}/code/dotfiles/main.yml
