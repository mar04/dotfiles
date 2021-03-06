#!/bin/bash

# check for interactive
[[ $- = *i* ]] || return

# make ctrl-s useful
stty -ixon

shopt -s autocd
shopt -s cdspell
shopt -s checkjobs
shopt -s checkwinsize
shopt -s cmdhist
shopt -s direxpand
shopt -s dirspell
shopt -s extglob
shopt -s globstar
shopt -s histappend
# shopt -s histreedit
shopt -s lithist


source "$XDG_CONFIG_HOME/sh/aliases"
source "$XDG_CONFIG_HOME/sh/functions"
# source "$XDG_CONFIG_HOME/sh/colored_man_pages.bash"
source /usr/share/doc/ranger/examples/bash_automatic_cd.sh
source /usr/share/doc/ranger/examples/bash_subshell_notice.sh
source /usr/share/fzf/completion.bash
source /usr/share/fzf/key-bindings.bash

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte.sh
fi

# set terminal window title to the name of executed command
# tmux and i3wm usage
# case "$TERM" in
#     rxvt*|xterm*)
#         set -o functrace
#         trap '[[ $BASH_SOURCE ]] || printf "\e]0;%s\a" "$BASH_COMMAND" >/dev/tty' DEBUG ;;
# esac

#COLORS
#eval $(dircolors -b ~/.dir_colors)

export GPG_TTY="$(tty)"

export PS1="[\$?] \[\e[0;34m\]\u\[\e[0m\]@\h \[\e[0;32m\]\w\[\e[0m\]\[\e[0;34m\] \$\[\e[0m\]"

# Adding the kdesrc-build directory to the path
export PATH="$HOME/kde/src/kdesrc-build:$PATH"

# Creating alias for running software built with kdesrc-build
kdesrc-run ()
{
  source "$HOME/kde/build/$1/prefix.sh" && "$HOME/kde/usr/bin/$1"
}


