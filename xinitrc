#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx

userresources=$HOME/.Xresources

# merge .Xresources
[ -f "$userresources" ] && xrdb -merge "$userresources"

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

# Set the keyboard to go fast and remap caps to escape
setxkbmap -option caps:swapescape
setxkbmap -layout us -variant intl

exec i3
