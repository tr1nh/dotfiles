#!/usr/bin/env bash
CONFIG="$HOME/.xbindkeysrc_mouse"

# Nếu đang bật thì tắt, nếu chưa bật thì kích hoạt
if pkill -f "xbindkeys -f $CONFIG"; then
    notify-send "Mouse Mode" "OFF" -t 800
else
    xbindkeys -f "$CONFIG"
    notify-send "Mouse Mode" "ON (Nhấn ESC để thoát)" -t 1500
fi
