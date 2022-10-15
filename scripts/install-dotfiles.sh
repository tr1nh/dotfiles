#!/usr/bin/bash

if [ ! -d dotfiles ]; then
  curl -LO https://github.com/tr1nh/dotfiles/archive/master.tar.gz
  tar -xzvf master.tar.gz
  mv dotfiles-master dotfiles
  echo "download dotfiles"
fi

cd dotfiles

cp -r .bash_profile .bashrc .config .gitconfig .inputrc .local .tmux.conf .vim .vimrc .Xdefaults .xinitrc .bookmark.sh .commacd.sh "$HOME"
echo "installed dotfiles"

_clean() {
  cd ..
  if [ -d dotfiles ]; then
    rm -rf dotfiles master.tar.gz
    echo "cleaned"
  fi
}

trap _clean EXIT
