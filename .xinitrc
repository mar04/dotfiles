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

# KEYBOARD MAP
# available options are in /usr/share/X11/xkb/rules/base.lst
setxkbmap \
    -layout pl \
    -option shift:both_capslock \
    -option ctrl:nocaps \
    -option terminate:ctrl_alt_bksp \
    #-option compose:lctrl \
    #-option grp:shifts_toggle \
    #-layout us,pl

# KEYBOARD SHORTCUTS
sxhkd &

# DPMS
xset -dpms

# SCREENSAVER
xset s off

# BELL
xset -b

# X RESOURCES
xrdb -merge ~/.config/Xresources/Xresources

# URXVT DAEMON
urxvtd -q -o -f

# MUSIC
[ ! -s ~/.cache/mpd/mpd.pid ] && mpd ~/.config/mpd/mpd.conf
#urxvtc -e ncmpcpp --config ~/.config/ncmpcpp/config &

# GMAIL
gmailchecker -c ~/.config/gmailchecker/config -b

# RSS

# COMPOSITOR
compton \
    --backend glx \
    --glx-no-stencil \
    --vsync opengl \
    --inactive-dim 0.4 \
    --use-ewmh-active-win \
    &

# WINDOW MANAGER
exec i3

