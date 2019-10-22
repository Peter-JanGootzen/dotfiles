#!/bin/sh
xrandr --output eDP-1 --off --output DP-1 --off --output HDMI-1 --primary --mode 2560x1080 --pos 1920x0 --rotate normal --output DP-2 --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-2 --off
feh --bg-scale ~/Pictures/Wallpapers/widescreen/p743jm2q87n31.png ~/Pictures/Wallpapers/hong-kong-background-hd-1920x1080-486883.jpg
launch-polybar.sh
