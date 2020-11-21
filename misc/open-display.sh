#/bin/sh

export USER="chen"
export HOME="/home/chen"
export DISPLAY=":0"
export XAUTHORITY="/home/chen/.Xauthority"

sleep 1
xrandr >/dev/null 2>/dev/null
xrandr --auto

exit 0
