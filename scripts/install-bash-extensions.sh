#!/usr/bin/env bash

if [ ! -d ~/.bash_extensions ]; then
  mkdir ~/.bash_extensions
fi

cd ~/.bash_extensions

# commacd
curl -LO https://raw.githubusercontent.com/shyiko/commacd/master/commacd.sh

# bash bookmark
curl -LO https://raw.githubusercontent.com/tr1nh/bash-bookmark/master/bookmark.sh

if [ ! -d ~/.local/bin ]; then
  mkdir -p ~/.local/bin
fi

cd ~/.local/bin

# f file manager
curl -LO https://raw.githubusercontent.com/tr1nh/f-file-manager/master/f
chmod +x f

# vimv
curl -LO https://raw.githubusercontent.com/thameera/vimv/master/vimv
chmod +x vimv

