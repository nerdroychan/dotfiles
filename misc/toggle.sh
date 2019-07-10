#!/bin/sh

EXTERNAL_OUTPUT="DP1"
INTERNAL_OUTPUT="eDP1"

mode=$1"m"

if [ $mode = "em" ]; then
        xrandr --output $INTERNAL_OUTPUT --off
        xrandr --output $EXTERNAL_OUTPUT --auto --dpi 192
elif [ $mode = "im" ]; then
        xrandr --output $INTERNAL_OUTPUT --auto --dpi 144
        xrandr --output $EXTERNAL_OUTPUT --off
elif [ $mode = "bm" ]; then
        xrandr --output $INTERNAL_OUTPUT --auto --dpi 144
        xrandr --output $EXTERNAL_OUTPUT --auto --dpi 192 --left-of $INTERNAL_OUTPUT
fi
