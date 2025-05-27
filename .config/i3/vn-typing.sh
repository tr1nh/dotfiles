#!/bin/bash

# show a popup to get raw input
# then substitude into vietnamese
# and paste text into GUI

dmenu -b </dev/null | sed 's/\\n/\n/g' | telex | xclip -sel clipboard -in
xdotool type "$(xclip -o -selection clipboard)"
# xdotool key ctrl+v