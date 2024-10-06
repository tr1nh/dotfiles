#!/bin/bash

# show a popup to get raw input
# then substitude into vietnamese
# and paste text into GUI

urxvt -g 30x5 -T 'vn typing (float)' -e bash -c 'telex -b "$(read text && echo $text)"'
xdotool key ctrl+v
xdotool key BackSpace # to clear newline
