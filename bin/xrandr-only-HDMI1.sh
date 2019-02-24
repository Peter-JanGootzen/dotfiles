#!/bin/sh
xrandr --output HDMI-2 --off --output HDMI-1 --primary --mode 2560x1080 --pos 0x0 --rotate normal --output DP-1 --off --output eDP-1 --off --output DP-2 --off
feh --bg-scale ~/Pictures/Wallpapers/wallhaven-651834.jpg
launch-polybar.sh
