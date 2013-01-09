#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# Source global definitions
#if [ -f /etc/bash.bashrc ]; then
#	. /etc/bash.bashrc
#fi

# User specific aliases and functions

if [ $TERM == "xterm" ]; then
	export TERM="xterm-256color"
fi


PS0='\[\e[0;34m\]\u\[\e[0m\]@\h \[\e[0;32m\]\w\[\e[0m\]\[\e[0;34m\] \$\[\e[0m\]'
PS1=$PS0


PATH=$PATH:/home/mariusz/.local/bin
#PATH=$PATH:/home/mariusz/.local/android-sdk-linux/tools
#PATH=$PATH:/home/mariusz/.local/android-sdk-linux/platform-tools
PATH=$PATH:/mariusz/.local/maple13_installation/bin


BROWSER=links
PAGER=less
EDITOR=emacs
VISUAL=$EDITOR


if [ -n "$DISPLAY" ]; then
     BROWSER=chromium
fi


# configure xdg-open

#alias startx='startx &> ~/.xlog'
alias ls="ls -h --color=auto --group-directories-first"
alias ll="ls -l"
alias lll="ll -ctr"
alias tree="tree -AC"
alias df="df -h"
#alias et="emacsclient -t"
#alias e="emacsclient -c"
alias cal="cal -m3"
alias alarm_enable='PS1="$PS0\a"'
alias alarm_disable='PS1=$PS0'

