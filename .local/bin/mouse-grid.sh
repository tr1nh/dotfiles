#!/usr/bin/env bash
cell="$1"

# Lấy độ phân giải màn hình hiện tại
read -r w h < <(xdpyinfo | awk '/dimensions/{print $2}' | tr 'x' ' ')

# Tính hàng và cột theo phím 1-9 (0-indexed)
idx=$((cell - 1))
col=$((idx % 3))
row=$((idx / 3))

# Tính tọa độ tâm ô
x=$(( (w / 3) * col + (w / 6) ))
y=$(( (h / 3) * row + (h / 6) ))

xdotool mousemove "$x" "$y"
