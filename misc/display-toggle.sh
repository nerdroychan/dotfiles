#/bin/sh

EXTERNAL_OUTPUT="DP1"
EXTERNAL_OUTPUT2="DP2"
INTERNAL_OUTPUT="eDP1"

mode=$1"m"

xrandr --output $INTERNAL_OUTPUT --auto \
       --output $EXTERNAL_OUTPUT --auto \
       --output $EXTERNAL_OUTPUT2 --auto

if [ $mode = "em" ]; then
    xrandr --output $INTERNAL_OUTPUT --off \
           --output $EXTERNAL_OUTPUT --auto \
           --output $EXTERNAL_OUTPUT2 --auto
elif [ $mode = "im" ]; then
    xrandr --output $INTERNAL_OUTPUT --auto \
           --output $EXTERNAL_OUTPUT --off \
           --output $EXTERNAL_OUTPUT2 --off
else
    xrandr
fi
