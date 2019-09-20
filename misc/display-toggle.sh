#/bin/sh

EXTERNAL_OUTPUT="DP2"
INTERNAL_OUTPUT="eDP1"

mode=$1"m"

if [ $mode = "em" ]; then
    xrandr --output $EXTERNAL_OUTPUT --auto --output $INTERNAL_OUTPUT --auto
    xrandr --output $EXTERNAL_OUTPUT --auto --output $INTERNAL_OUTPUT --off
elif [ $mode = "im" ]; then
    xrandr --output $EXTERNAL_OUTPUT --auto --output $INTERNAL_OUTPUT --auto
    xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --off
elif [ $mode = "bm" ]; then
    xrandr --output $EXTERNAL_OUTPUT --auto --output $INTERNAL_OUTPUT --auto
    xrandr --output $EXTERNAL_OUTPUT --auto \
           --output $INTERNAL_OUTPUT --auto --right-of $EXTERNAL_OUTPUT
else
    xrandr --output $EXTERNAL_OUTPUT --auto --output $INTERNAL_OUTPUT --auto
fi
