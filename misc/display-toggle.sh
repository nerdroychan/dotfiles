#/bin/sh

EXTERNAL_OUTPUT1="DP-1"
EXTERNAL_OUTPUT2="DP-2"
EXTERNAL_OUTPUT3="DP-3"
EXTERNAL_OUTPUT4="DP-4"
INTERNAL_OUTPUT="eDP"

mode=$1"m"

# xrandr --output $INTERNAL_OUTPUT --auto \
#        --output $EXTERNAL_OUTPUT --auto \
#        --output $EXTERNAL_OUTPUT2 --auto \
#        --output $EXTERNAL_OUTPUT3 --auto

if [ $mode = "em" ]; then
    xrandr --output $INTERNAL_OUTPUT --off \
           --output $EXTERNAL_OUTPUT1 --auto \
           --output $EXTERNAL_OUTPUT2 --auto \
           --output $EXTERNAL_OUTPUT3 --auto \
           --output $EXTERNAL_OUTPUT4 --auto
elif [ $mode = "im" ]; then
    xrandr --output $INTERNAL_OUTPUT --auto \
           --output $EXTERNAL_OUTPUT1 --off \
           --output $EXTERNAL_OUTPUT2 --off \
           --output $EXTERNAL_OUTPUT3 --off \
           --output $EXTERNAL_OUTPUT4 --off
else
    xrandr
fi
