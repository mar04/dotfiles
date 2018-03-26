#!/bin/bash
# GLOBAL SETTINGS
# if [ -d /etc/X11/xinit/xinitrc.d ]; then
#     for f in /etc/X11/xinit/xinitrc.d/*; do
#         [ -x "$f" ] && . "$f"
#     done
#     unset f
# fi

# source ~/.xprofile

# KEYBOARD SHORTCUTS
# sxhkd &
xbindkeys

# X RESOURCES
# xrdb -merge ~/.config/Xresources/Xresources

# SCREENSAVER
# controll screenlocker by dpms timeout, so that it can be inhibited
# xset s off
# xss-lock -- i3lock -n -d -c 888888 &

# BELL
# xset -b

# URXVT DAEMON
# urxvtd -q -o -f

# dex -ae MARIUSZ

# WM
# exec i3
# exec openbox-session
# exec wingo

# DE
# exec gnome-session
# exec mate-session
exec startkde
# exec startxfce4
