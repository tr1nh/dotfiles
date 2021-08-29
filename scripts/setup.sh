#!/usr/bin/env bash

if [ ! -d dotfiles ]; then
  curl -LO https://github.com/tr1nh/dotfiles/archive/master.tar.gz
  tar -xzvf master.tar.gz
  mv dotfiles-master dotfiles
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
    echo "# autostart x at login\nif [ -z \"\${DISPLAY}\" ] && [ \"\${XDG_VTNR}\" -eq 1 ]; then\n  exec startx\nfi" >> ~/.bash_profile
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

# install coding fonts:
read -p "Install coding fonts? (yes/no): " prompt
if [ "$prompt" = "yes" ] || [ "$prompt" = "y" ]; then
  sh scripts/install-coding-fonts.sh
fi

# install ubuntu fonts:
read -p "Install ubuntu fonts? (yes/no): " prompt
if [ "$prompt" = "yes" ] || [ "$prompt" = "y" ]; then
  sh scripts/install-ubuntu-fonts.sh
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
fi

# install gtk config:
read -p "Install GTK config? (yes/no): " prompt
if [ "$prompt" = "yes" ] || [ "$prompt" = "y" ]; then
  sh scripts/install-gtk-config.sh
fi

# update grub:
read -p "Want to update grub? (yes/no): " prompt
if [ "$prompt" = "yes" ] || [ "$prompt" = "y" ]; then
  sudo vim /etc/default/grub
  sudo grub-mkconfig -o /boot/grub/grub.cfg
fi

clean() {
  cd ..
  rm -rf dotfiles
  rm master.tar.gz
}

trap clean EXIT

