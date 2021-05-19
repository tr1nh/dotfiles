#!/usr/bin/env bash

if [ ! -d dotfiles ]; then
  git clone https://github.com/tr1nh/dotfiles
fi

cd dotfiles

# install packages:
read -p "Install packages for (manjaro/msys2/termux/ubuntu): " prompt
case "$prompt" in
  manjaro)
    sh scripts/install-manjaro-packages.sh
    ;;
  msys2)
    sh scripts/install-msys2-packages.sh
    ;;
  termux)
    sh scripts/install-termux-packages.sh
    ;;
  ubuntu)
    sh scripts/install-ubuntu-packages.sh
    ;;
  *)
    echo "Not install any packages"
    ;;
esac

# install dotfiles:
read -p "Install dotfiles? (yes/no): " prompt
if [ "$prompt" = "yes" ] || [ "$prompt" = "y" ]; then
  sh scripts/install-dotfiles.sh

  read -p "Enable auto login tty1 for xinit? (yes/no): " prompt
  if [ "$prompt" = "yes" ] || [ "$prompt" = "y" ]; then
    echo -e "# autostart x at login\nif [ -z \"\${DISPLAY}\" ] && [ \"\${XDG_VTNR}\" -eq 1 ]; then\n  exec startx\nfi" >> ~/.bash_profile
  fi

  read -p "Install vim config for root? (yes/no): " prompt
  if [ "$prompt" = "yes" ] || [ "$prompt" = "y" ]; then
    sudo ln -s $HOME/.vimrc /root/
    sudo ln -s $HOME/.vim /root/
  fi
fi

# install bash extensions:
read -p "Install bash extensions? (yes/no): " prompt
if [ "$prompt" = "yes" ] || [ "$prompt" = "y" ]; then
  sh scripts/install-bash-extensions.sh
fi

# install fonts:
read -p "Install fonts? (yes/no): " prompt
if [ "$prompt" = "yes" ] || [ "$prompt" = "y" ]; then
  sh scripts/install-fonts.sh
fi

# install vim plugins:
read -p "Install vim plugins? (yes/no): " prompt
if [ "$prompt" = "yes" ] || [ "$prompt" = "y" ]; then
  sh scripts/install-vim-plugins.sh
fi

# install themes:
read -p "Install Qogir GTK themes? (yes/no): " prompt
if [ "$prompt" = "yes" ] || [ "$prompt" = "y" ]; then
  sh scripts/install-qogir-gtk.sh
fi

# install icons:
read -p "Install Papirus icons? (yes/no): " prompt
if [ "$prompt" = "yes" ] || [ "$prompt" = "y" ]; then
  sh scripts/install-papirus-icon.sh
  sh scripts/install-mcmojave-cursors.sh
fi

# install cursors:
read -p "Install mc-mojave cursors? (yes/no): " prompt
if [ "$prompt" = "yes" ] || [ "$prompt" = "y" ]; then
  sh scripts/install-mcmojave-cursors.sh
fi

# update grub:
read -p "Want to update grub? (yes/no): " prompt
if [ "$prompt" = "yes" ] || [ "$prompt" = "y" ]; then
  sudo vim /etc/default/grub
  sudo grub-mkconfig -o /boot/grub/grub.cfg
fi

