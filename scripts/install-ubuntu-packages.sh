#!/usr/bin/env bash

read -p "Install packages for (ubuntu/proot): " input

if [ "$input" = "ubuntu" ]; then
  sudo apt install tigervnc-common tigervnc-standalone-server xorg xinit \
    openbox dunst rofi tint2 lxappearance adwaita-icon-theme-full libnotify-bin rxvt-unicode \
    tree unrar p7zip-full pcmanfm \
    curl git w3m transmission-cli firefox \
    vim-gtk3 emacs imagemagick ffmpeg gifsicle scrot pandoc gimp inkscape libreoffice poppler-utils mupdf-tools \
    feh mediainfo \
    ghostscript build-essential python3-pip nudoku -y
else
  apt install tigervnc-common tigervnc-standalone-server \
    openbox dunst rofi tint2 lxappearance adwaita-icon-theme-full libnotify-bin rxvt-unicode \
    tree unrar p7zip-full pcmanfm \
    curl git w3m transmission-cli firefox \
    vim-gtk3 emacs imagemagick ffmpeg gifsicle scrot pandoc gimp inkscape libreoffice poppler-utils mupdf-tools \
    feh vlc mediainfo \
    ghostscript build-essential python3-pip nudoku -y
fi

