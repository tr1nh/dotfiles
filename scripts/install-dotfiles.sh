#!/usr/bin/env bash

cd;
git clone https://github.com/tr1nh/dotfiles;
cd dotfiles;

# copy dotfiles
ls -a | sed -E '/(\.$|images|README.md|scripts|.git$)/d' | xargs -i{} cp -r {} ~;

# install package
sh scripts/install-manjaro-package.sh;

# install bash
sh scripts/install-bash-extensions.sh;

# install font
sh scripts/install-font.sh;

# install vim
sh scripts/install-vim-plugin.sh;

sudo ln -s $HOME/.vimrc /root/;
sudo ln -s $HOME/.vim /root/;

# install theme & icon
sh scripts/install-qogir-gtk.sh;
sh scripts/install-papirus-icon.sh;
sh scripts/install-mcmojave-cursors.sh;

echo -e "gtk-theme-name=\"Qogir-light\"\ngtk-icon-theme-name=\"Papirus\"\ngtk-font-name=\"Cantarell 11\"\ngtk-cursor-theme-name=\"McMojave-cursors\"\ngtk-cursor-theme-size=0\ngtk-toolbar-style=GTK_TOOLBAR_BOTH\ngtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR\ngtk-button-images=1\ngtk-menu-images=1\ngtk-enable-event-sounds=1\ngtk-enable-input-feedback-sounds=1\ngtk-xft-antialias=1\ngtk-xft-hinting=1\ngtk-xft-hintstyle=\"hintfull\"\ngtk-xft-rgba=\"rgb\"\ngtk-modules=\"gail:atk-bridge\"" > ~/.gtkrc-2.0

mkdir -p ~/.config/gtk-3.0
echo -e "[Settings]\ngtk-theme-name=Qogir-light\ngtk-icon-theme-name=Papirus\ngtk-font-name=Cantarell 11\ngtk-cursor-theme-name=McMojave-cursors\ngtk-cursor-theme-size=0\ngtk-toolbar-style=GTK_TOOLBAR_BOTH\ngtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR\ngtk-button-images=1\ngtk-menu-images=1\ngtk-enable-event-sounds=1\ngtk-enable-input-feedback-sounds=1\ngtk-xft-antialias=1\ngtk-xft-hinting=1\ngtk-xft-hintstyle=hintfull\n\ngtk-xft-rgba=rgb\ngtk-modules=gail:atk-bridge" > ~/.config/gtk-3.0/settings.ini

mkdir -p ~/.icons/default
echo -e "[Icon\nTheme]\nName=Default\nComment=Default\nCursor\nTheme\nInherits=McMojave-cursors" > ~/.icons/default/index.theme

sudo ln -s $HOME/.gtkrc-2.0 /root/;
sudo mkdir /root/.config;
sudo ln -s $HOME/.config/gtk-3.0 /root/.config/;

# update grub
sudo vim /etc/default/grub;
sudo grub-mkconfig -o /boot/grub/grub.cfg;

