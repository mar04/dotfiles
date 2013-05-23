#!/bin/bash
#
# ~/.xinitrc
#

# cleanup
killall gnome-keyring-daemon

if [ -d /etc/X11/xinit/xinitrc.d ]; then
	for f in /etc/X11/xinit/xinitrc.d/*; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

#BCKG="$HOME/pic/artwork/hardy.png"
BCKG="$HOME/pic/artwork/arch_grey.png"

feh --no-fehbg --bg-fill $BCKG
#xsetroot -grey

setxkbmap \
	-layout us,pl \
	-option grp:shifts_toggle \
	-option ctrl:nocaps \
	#-option compose:lctrl \
	-option terminate:ctrl_alt_bksp

xset -b
xset -dpms

xrdb -merge ~/.Xresources

xbindkeys

#xautolock \
#	-time 8 \
#	-locker "i3lock -d -i $BCKG" \
#	&

# this doesn't seem to work
	#-killtime 12 \
	#-killer "systemctl suspend" \

urxvtd -q -o -f

[ ! -s ~/.config/mpd/mpd.pid ] && mpd ~/.config/mpd/mpd.conf

#echo 0 > ~/.cache/mail
gnome-gmail-notifier &

exec i3

