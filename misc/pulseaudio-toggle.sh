#/bin/sh

mode=$1"m"

if [ $mode = "am" ]; then
    pactl set-card-profile 0 output:analog-stereo
elif [ $mode = "d1m" ]; then
    pactl set-card-profile 0 output:hdmi-stereo
elif [ $mode = "d2m" ]; then
    pactl set-card-profile 0 output:hdmi-stereo-extra1
else
    pacmd list-cards | grep 'active profile'
fi
