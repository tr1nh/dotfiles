#/usr/bin/env bash

cd /tmp

mkdir install
cd install

curl -L https://github.com/vinceliuice/Qogir-theme/archive/master.zip -o qogir-gtk.zip
7z x qogir-gtk.zip
cd Qogir-theme-master
sh install.sh -t standard -w standard

cd ..
curl -L https://github.com/tr1nh/qogir-theme-openbox/archive/master.zip -o qogir-openbox.zip
7z x qogir-openbox.zip
cd qogir-theme-openbox-master
mv Qogir-Dark/openbox-3 ~/.themes/Qogir-dark
mv Qogir-Light/openbox-3 ~/.themes/Qogir-light

