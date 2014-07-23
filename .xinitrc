#!/bin/bash
#
# ~/.xinitrc
#

# GLOBAL SETTINGS
if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

. ~/.xprofile

# KEYBOARD SHORTCUTS
sxhkd &

# SCREENSAVER
# controll screenlocker by dpms timeout, so that it can be inhibited
xset s off
xss-lock -- i3lock -n -d -c 888888 &

# BELL
xset -b

# URXVT DAEMON
urxvtd -q -o -f

dex -ae MARIUSZ

thunar --daemon &

exec i3
# exec compiz --replace --sm-disable ccp
# exec startxfce4
