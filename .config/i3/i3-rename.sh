#!/bin/bash

urxvt -g 50x3 -T 'Rename workspace (float)' -e bash -c 'read -p '\''New workspace name: '\'' text && i3-msg "rename workspace to \"$text\""'
