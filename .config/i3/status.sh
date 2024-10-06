#!/bin/bash

echo '{"version": 1}'
echo '['
echo '[]'

while :;do
	echo ',['
	echo "{\"name\": \"power\", \"full_text\": \"$(upower -i `upower -e | grep BAT0` | awk '/state:/ {printf "%s ", $2} /percentage:/ {print $2}')\"},"
	echo "{\"name\": \"date_time\", \"full_text\": \"$(date +'%Y-%m-%d %H:%M:%S ')\"}"
	echo ']'
	sleep 5s
done
