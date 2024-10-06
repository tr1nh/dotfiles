#/usr/bin/env bash

# resolution
xrandr --output eDP-1 --mode 1368x768

# config for dunst with HiDPI
# xrandr --output eDP-1 --mode 1280x800 --dpi 120

# wallpaper:
~/.fehbg &

# compositor
# compton &

# mute volume:
pactl set-sink-volume 0 0% &

# enable tapping on synaptics touchpad:
xinput set-prop $(xinput list | grep Touchpad | awk '{print $6}' | cut -d '=' -f 2) 'libinput Tapping Enabled' 1 &

# notification daemon
dunst &
