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
# available options are in /usr/share/X11/xkb/rules/evdev.lst
setxkbmap \
    -layout pl \
    -option ctrl:nocaps \
    -option lv3:ralt_alt \
    -option compose:lctrl \
    -option lv3:menu_switch \
    -option shift:both_capslock \
    -option terminate:ctrl_alt_bksp

# MAP LEFT CTRL TO ESCAPE ON RELEASE
xcape

# KEYBOARD SHORTCUTS
sxhkd &

# KEY REPEAT
xset r rate 250 30

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
killall gmailchecker
gmailchecker -c ~/.config/gmailchecker/config -b

# COMPOSITOR
compton \
    --backend glx \
    --vsync opengl \
    --glx-no-stencil \
    --inactive-dim 0.4 \
    --use-ewmh-active-win \
    &

# WINDOW MANAGER
exec i3
