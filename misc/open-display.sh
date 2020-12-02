#/bin/sh

export USER="chen"
export HOME="/home/chen"
export DISPLAY=":0"
export XAUTHORITY="/home/chen/.Xauthority"
export LOCK="/tmp/.DISPLAYLOCK"

sleep 1

mkdir $LOCK >/dev/null 2>/dev/null || exit 1

trap "rm -rf ${LOCK}; exit" INT TERM EXIT

xrandr >/dev/null 2>/dev/null
xrandr --auto

i3-msg restart >/dev/null 2>/dev/null

rm -rf $LOCK
