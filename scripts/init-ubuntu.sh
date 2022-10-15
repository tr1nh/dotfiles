#!/usr/bin/env bash

# update grub
sudo sed -i 's/GRUB_CMDLINE_LINUX=""/GRUB_CMDLINE_LINUX="quiet"/' /etc/default/grub
sudo update-grub

# change timezone
sudo timedatectl set-timezone Asia/Ho_Chi_Minh

# disable snap
sudo umount $(df -h | grep /snap/core | awk '{print $1}')
sudo apt purge snapd -y

# disable service wait online
sudo systemctl disable NetworkManager-wait-online.service

# disable cloud-init
sudo touch /etc/cloud/cloud-init.disabled

# change brightness
sudo sh -c "echo 150 > /sys/class/backlight/intel_backlight/brightness"

# update apt packages repositories
sudo apt update

# upgrade apt packages
sudo apt upgrade -y

# install neccessary packages
sh -c "$(curl -sL https://raw.githubusercontent.com/tr1nh/dotfiles/master/scripts/install-ubuntu-packages.sh)"
sh -c "$(curl -sL https://raw.githubusercontent.com/tr1nh/dotfiles/master/scripts/install-ubuntu-fonts.sh)"

# install coding fonts
sh -c "$(curl -sL https://raw.githubusercontent.com/tr1nh/dotfiles/master/scripts/install-coding-fonts.sh)"
