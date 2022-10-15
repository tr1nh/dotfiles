#!/usr/bin/env bash


apt update && apt upgrade
apt update && apt upgrade

apt install termux-api termux-services proot-distro tmux git htop at cronie openssl tree fzf p7zip unrar wget curl openssh transmission w3m nmap iproute2 httrack nano vim neovim emacs figlet poppler mupdf-tools imagemagick gifsicle ffmpeg man bat termimage catimg timg mediainfo mpv cmus pulseaudio build-essential python nodejs-lts jq tidy ghostscript nudoku nethack -y

if [ ! $? -eq 0 ]; then
  exit 1
fi

proot-distro install debian

echo "extra-keys = [[ESC, TAB, CTRL, ALT, {key: 'LEFT', popup: 'HOME'}, {key: 'DOWN', popup: 'PGDN'}, {key: 'UP', popup: 'PGUP'}, {key: 'RIGHT', popup: 'END'}]]" >> ~/.termux/termux.properties

cd ..
tar -zcvf /storage/emulated/0/.backup-termux.tar.gz usr/ home/

cd

mkdir /storage/emulated/0/.tr1nh
ln -s $TMPDIR 
ln -s /storage/emulated/0
ln -s /storage/emulated/0/.tr1nh/

proot-distro login debian -- apt update
proot-distro login debian -- sh -c "$(curl -sL https://raw.githubusercontent.com/tr1nh/dotfiles/master/scripts/install-debian-packages.sh)"
proot-distro login debian -- sh -c "$(curl -sL https://raw.githubusercontent.com/tr1nh/dotfiles/master/scripts/install-ubuntu-fonts.sh | sed 's/sudo//' | sed 's/fonts-khmeros-core//' | sed 's/fonts-ubuntu//')"
proot-distro login debian -- sh -c "$(curl -sL https://raw.githubusercontent.com/tr1nh/dotfiles/master/scripts/install-gtk-theme.sh)"

proot-distro backup --output /storage/emulated/0/.backup-debian.tar.gz debian
