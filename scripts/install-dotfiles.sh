#!/usr/bin/env bash

read -p "Choose a text editor: " editor

entries=$(ls -a | grep -Ev '^[.]+$' | grep -Ev 'README.md|images|scripts|.git$' | xargs realpath > selected.txt)
#read -n 1 -s -r -p "Choose file and folder for copy to home directory (press any key to continue)"
"$editor" selected.txt
xargs -a selected.txt -i{} cp -r {} ~

clean() {
  echo "Cleaned temporary"
  rm selected.txt
}

trap clean EXIT
