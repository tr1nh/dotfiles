#/usr/bin/env bash

# generate local gtk config:
echo "gtk-theme-name=\"Qogir-light\"\ngtk-icon-theme-name=\"Papirus\"\ngtk-font-name=\"Cantarell 11\"\ngtk-cursor-theme-name=\"Adwaita\"\ngtk-cursor-theme-size=0\ngtk-toolbar-style=GTK_TOOLBAR_BOTH\ngtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR\ngtk-button-images=1\ngtk-menu-images=1\ngtk-enable-event-sounds=1\ngtk-enable-input-feedback-sounds=1\ngtk-xft-antialias=1\ngtk-xft-hinting=1\ngtk-xft-hintstyle=\"hintfull\"\ngtk-xft-rgba=\"rgb\"\ngtk-modules=\"gail:atk-bridge\"" > ~/.gtkrc-2.0

if [ ! -d ~/.config/gtk-3.0 ]; then
  mkdir -p ~/.config/gtk-3.0
fi
echo "[Settings]\ngtk-theme-name=Qogir-light\ngtk-icon-theme-name=Papirus\ngtk-font-name=Cantarell 11\ngtk-cursor-theme-name=Adwaita\ngtk-cursor-theme-size=0\ngtk-toolbar-style=GTK_TOOLBAR_BOTH\ngtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR\ngtk-button-images=1\ngtk-menu-images=1\ngtk-enable-event-sounds=1\ngtk-enable-input-feedback-sounds=1\ngtk-xft-antialias=1\ngtk-xft-hinting=1\ngtk-xft-hintstyle=hintfull\n\ngtk-xft-rgba=rgb\ngtk-modules=gail:atk-bridge" > ~/.config/gtk-3.0/settings.ini

if [ ! -d ~/.icons/default ]; then
  mkdir -p ~/.icons/default
fi
echo "[Icon Theme]\nName=Default\nComment=Default\nCursor\nTheme\nInherits=Adwaita" > ~/.icons/default/index.theme

# update root gtk config:
read -p "Update gtk config for root (yes/no): " prompt

if [ "$prompt" = "yes" ] || [ "$prompt" = "y" ]; then
  sudo ln -s $HOME/.gtkrc-2.0 /root/;
  sudo mkdir /root/.config;
  sudo ln -s $HOME/.config/gtk-3.0 /root/.config/;
fi

