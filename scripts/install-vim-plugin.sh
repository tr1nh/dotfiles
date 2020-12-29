#!/usr/bin/env bash

mkdir -p bundle/start
cd bundle/start
git clone https://github.com/dracula/vim
git clone https://github.com/tomasr/molokai
git clone https://github.com/morhetz/gruvbox
git clone https://github.com/itchyny/landscape.vim
git clone https://github.com/itchyny/lightline.vim
git clone https://github.com/mg979/vim-visual-multi
git clone https://github.com/mattn/emmet-vim
git clone https://github.com/othree/html5.vim

# cd ../..
# mkdir -p bundle/opt
# cd bundle/opt
# git clone https://github.com/nathanaelkane/vim-indent-guides
# git clone https://github.com/gregsexton/gitv
# git clone https://github.com/dense-analysis/ale
# git clone https://github.com/preservim/nerdtree
# git clone https://github.com/airblade/vim-gitgutter
# git clone https://github.com/tpope/vim-fugitive

echo "All done, copy bundle folder to your vim run time path..."

