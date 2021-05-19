#!/usr/bin/env bash

if [ ! -d ~/.vim/pack/bundle/start ]; then
  mkdir -p ~/.vim/pack/bundle/start
fi

cd ~/.vim/pack/bundle/start
git clone https://github.com/dracula/vim
git clone https://github.com/tomasr/molokai
git clone https://github.com/morhetz/gruvbox
git clone https://github.com/itchyny/landscape.vim
git clone https://github.com/itchyny/lightline.vim
git clone https://github.com/mg979/vim-visual-multi
git clone https://github.com/mattn/emmet-vim
git clone https://github.com/othree/html5.vim

