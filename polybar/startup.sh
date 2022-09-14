#!/bin/sh

PRIMARY=$(xrandr --query | grep " connected" | grep "primary" | cut -d" " -f1)
OTHERS=$(xrandr --query | grep " connected" | grep -v "primary" | cut -d" " -f1)

export DEFAULT_NETWORK_INTERFACE=$(ip route | grep '^default' | awk '{print $5}' | head -n1)

echo "Primary: "$PRIMARY
echo "Others: "$OTHERS

MONITORS=("$PRIMARY" "$OTHERS")

if type "xrandr"; then
    env MONITOR=$PRIMARY TRAY=right polybar --reload default &> /tmp/polybar-$USER-$MONITOR.log &
    for m in $OTHERS; do
        env MONITOR=$m polybar --reload default &> /tmp/polybar-$USER-$MONITOR.log &
    done
fi

exit 0
