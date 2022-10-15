#/usr/bin/env bash

# wallpaper:
~/.fehbg &

# mute volume:
pactl set-sink-volume 0 0% &

# enable tapping on synaptics touchpad:
xinput set-prop $(xinput list | grep Synaptics | awk '{print $5}' | cut -d '=' -f 2) 'libinput Tapping Enabled' 1 &
dunst &

