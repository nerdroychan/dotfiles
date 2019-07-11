#/bin/sh

EXTERNAL_OUTPUT="DP1"
INTERNAL_OUTPUT="eDP1"

mode=$1"m"

if [ $mode = "em" ]; then
    xrandr --output $INTERNAL_OUTPUT --off \
           --output $EXTERNAL_OUTPUT --auto --mode 3840x2160 \
           --fb 3840x2160 --dpi 192
elif [ $mode = "im" ]; then
    xrandr --output $EXTERNAL_OUTPUT --off \
           --output $INTERNAL_OUTPUT --auto --mode 1920x1080 \
           --fb 1920x1080 --dpi 144
elif [ $mode = "bm" ]; then
    xrandr --fb 7680x4320 --dpi 192 \
           --output $EXTERNAL_OUTPUT --auto --mode 3840x2160 \
           --output $INTERNAL_OUTPUT --auto --scale 2x2 --pos 3840x0 \
                                     --panning 3840x2160+3840+0
else
    xrandr --auto
fi