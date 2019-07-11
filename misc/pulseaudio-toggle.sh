#/bin/sh

mode=$1"m"

if [ $mode = "am" ]; then
    pactl set-card-profile 0 output:analog-stereo
elif [ $mode = "dm" ]; then
    pactl set-card-profile 0 output:hdmi-stereo
else
    pacmd list-cards | grep 'active profile'
fi
