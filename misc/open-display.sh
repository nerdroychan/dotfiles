#/bin/sh

export USER="chen"
export HOME="/home/chen"
export DISPLAY=":0"
export XAUTHORITY="/home/chen/.Xauthority"

sleep 1
timeout 3s xrandr >/dev/null 2>/dev/null
timeout 3s xrandr --auto

exit 0
