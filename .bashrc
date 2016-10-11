#!/bin/bash

# check for interactive
[[ $- = *i* ]] || return

# make ctrl-s useful
stty -ixon

shopt -s autocd
shopt -s cdspell
shopt -s checkjobs
shopt -s checkwinsize
shopt -s direxpand
shopt -s dirspell
shopt -s histappend

PS0="[\$?] \[\e[0;34m\]\u\[\e[0m\]@\h \[\e[0;32m\]\w\[\e[0m\]\[\e[0;34m\] \$\[\e[0m\]"
export PS1=$PS0

source ~/.config/sh/aliases
source ~/.config/sh/functions
# source ~/.config/sh/colored_man_pages.bash
source /usr/share/doc/ranger/examples/bash_automatic_cd.sh
source /usr/share/doc/ranger/examples/bash_subshell_notice.sh

if [[ $TERMINIX_ID ]]; then
    source /etc/profile.d/vte.sh
fi

# overload some terminal colors for better vim + gruvbox experience
[ "$TERM" != "linux" ] && ~/bin/gruvbox_256palette

# set terminal window title to the name of executed command
# tmux and i3wm usage
case "$TERM" in
    rxvt*|xterm*)
        set -o functrace
        trap '[[ $BASH_SOURCE ]] || printf "\e]0;%s\a" "$BASH_COMMAND" >/dev/tty' DEBUG ;;
esac

#COLORS
#eval $(dircolors -b ~/.dir_colors)
