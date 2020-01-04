#/bin/sh

EXTERNAL_OUTPUT="DisplayPort-0"
EXTERNAL_OUTPUT2="DisplayPort-1"
EXTERNAL_OUTPUT3="HDMI-A-0"
INTERNAL_OUTPUT="eDP"

mode=$1"m"

# xrandr --output $INTERNAL_OUTPUT --auto \
#        --output $EXTERNAL_OUTPUT --auto \
#        --output $EXTERNAL_OUTPUT2 --auto \
#        --output $EXTERNAL_OUTPUT3 --auto

if [ $mode = "em" ]; then
    xrandr --output $INTERNAL_OUTPUT --off \
           --output $EXTERNAL_OUTPUT --auto \
           --output $EXTERNAL_OUTPUT2 --auto \
           --output $EXTERNAL_OUTPUT3 --auto
elif [ $mode = "im" ]; then
    xrandr --output $INTERNAL_OUTPUT --auto \
           --output $EXTERNAL_OUTPUT --off \
           --output $EXTERNAL_OUTPUT2 --off \
           --output $EXTERNAL_OUTPUT3 --off 
else
    xrandr
fi
