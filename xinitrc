#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx

userresources=$HOME/.Xresources

# merge .Xresources
if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

# imports some GTK2 confs
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

# these are .sh's which some programs use to be enabled on start up (BE WARE), only systemd and gtk is gud
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# Start the keyring daeomon and sock
dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# Set the keyboard to go fast and remap caps to escape
# setxkbmap -option caps:swapescape

exec i3

# sudo udevmon -c ~/.config/caps2esc.yaml
