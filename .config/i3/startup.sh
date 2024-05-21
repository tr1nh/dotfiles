#/usr/bin/env bash

# wallpaper:
~/.fehbg &

# compositor
# compton&

# mute volume:
pactl set-sink-volume 0 0% &

# enable tapping on synaptics touchpad:
xinput set-prop $(xinput list | grep Touchpad | awk '{print $6}' | cut -d '=' -f 2) 'libinput Tapping Enabled' 1 &

# notification daemon
dunst &

# resolution
xrandr --output eDP-1 --mode 1368x768

# brightness
brightness 600
