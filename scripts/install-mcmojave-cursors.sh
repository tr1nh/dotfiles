#/usr/bin/env bash

cd /tmp

mkdir install
cd install

curl -L https://github.com/vinceliuice/McMojave-cursors/archive/refs/heads/master.zip -o cursors.zip 
7z x cursors.zip
cd McMojave-cursors-master
sh install.sh

