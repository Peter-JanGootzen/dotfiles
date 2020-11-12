#!/bin/bash
#
# ~/.xinitrc
#
# Executed by startx

if xrandr | grep 3840x2160 > /dev/null; then
    export MONITOR_SETUP=desktop
else
    export MONITOR_SETUP=laptop
fi
source dpi-setup.sh

xrdb ~/.Xresources

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

keyboard.sh

exec i3
