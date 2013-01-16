#!/bin/bash
#
# ~/.xinitrc
#

if [ -d /etc/X11/xinit/xinitrc.d ]; then
	for f in /etc/X11/xinit/xinitrc.d/*; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

BCKG="$HOME/pic/artwork/hardy.png"

feh --no-fehbg --bg-fill $BCKG

setxkbmap \
	-layout us,pl \
	-option grp:shifts_toggle \
	-option ctrl:nocaps \
	-option compose:lctrl \
#	-option terminate:ctrl_alt_bksp

xset -b

xrdb -merge ~/.Xresources

xbindkeys

xautolock \
	-time 8 \
	-locker "i3lock -d -i $BCKG" \
	-killtime 15 \
	-killer "systemctl suspend" \
	&

urxvtd -q -o -f

exec i3

