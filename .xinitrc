#!/bin/sh
#
# ~/.xinitrc
#

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

feh --no-fehbg --bg-fill "$HOME/pic/artwork/hardy.png"

setxkbmap \
    -layout us,pl \
    -option grp:shifts_toggle \
    -option ctrl:nocaps \
    -option compose:lctrl \
    -option terminate:ctrl_alt_bksp

xset -b

xrdb -merge ~/.Xresources

urxvtd -q -o -f

#emacs daemon?

xbindkeys

exec i3

# avoid leaving open terminal session ?

