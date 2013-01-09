#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

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

xset -b dpms 180 240 360

#fonts?
#emacs daemon?

#consider removing -merge
#do not background this
xrdb -merge ~/.Xresources

xscreensaver -no-splash &

urxvtd -q -o -f

i3

# avoid leaving open terminal session
exit

