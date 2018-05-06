#!/usr/bin/sh

sleep .5

if ! pgrep -x polybar; then
    polybar main &
else
    pkill -USR1 polybar
fi

echo "Bars launched..."
