#
# .bashrc - interactive shell configuration
#

# check for interactive
[[ $- = *i* ]] || return

shopt -s autocd
shopt -s checkwinsize
shopt -s histappend

PS0='\[\e[0;34m\]\u\[\e[0m\]@\h \[\e[0;32m\]\w\[\e[0m\]\[\e[0;34m\] \$\[\e[0m\]'
PS8='[$?] \[\e[0;34m\]\u\[\e[0m\]@\h \[\e[0;32m\]\w\[\e[0m\]\[\e[0;34m\] \$\[\e[0m\]'

export PS1=$PS0

if [ -n "$DISPLAY" ]; then
	export BROWSER=chromium
else
	export BROWSER=links
fi

. $HOME/.aliases
#. $HOME/.functions

# set terminal window title to the name of executed command
case "$TERM" in
	rxvt*|xterm*)
		set -o functrace
		trap '[[ $BASH_SOURCE ]] || printf "\e]0;%s\a" "$BASH_COMMAND" >/dev/tty' DEBUG
		;;
esac

