#/bin/sh

EXTERNAL_OUTPUT1="HDMI-1"
EXTERNAL_OUTPUT2="DP-1"
EXTERNAL_OUTPUT3="DP-2"
INTERNAL_OUTPUT="eDP-1"

mode=$1"m"

# xrandr --output $INTERNAL_OUTPUT --auto \
#        --output $EXTERNAL_OUTPUT --auto \
#        --output $EXTERNAL_OUTPUT2 --auto \
#        --output $EXTERNAL_OUTPUT3 --auto

if [ $mode = "em" ]; then
    xrandr --output $INTERNAL_OUTPUT --off \
           --output $EXTERNAL_OUTPUT1 --auto \
           --output $EXTERNAL_OUTPUT2 --auto \
           --output $EXTERNAL_OUTPUT3 --auto
elif [ $mode = "im" ]; then
    xrandr --output $INTERNAL_OUTPUT --auto \
           --output $EXTERNAL_OUTPUT1 --off \
           --output $EXTERNAL_OUTPUT2 --off \
           --output $EXTERNAL_OUTPUT3 --off
else
    xrandr
fi
