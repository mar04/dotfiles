#
# .bashrc - interactive shell configuration
#

# check for interactive
[[ $- = *i* ]] || return

# make ctrl-s useful
stty -ixon

# overload some terminal colors for better vim + gruvbox experience
[ "$TERM" != "linux" ] && ~/bin/gruvbox_256palette

shopt -s autocd
shopt -s cdspell
shopt -s checkjobs
shopt -s checkwinsize
shopt -s direxpand
shopt -s dirspell
shopt -s histappend

PS0='\[\e[0;34m\]\u\[\e[0m\]@\h \[\e[0;32m\]\w\[\e[0m\]\[\e[0;34m\] \$\[\e[0m\]'
PS8='[$?] \[\e[0;34m\]\u\[\e[0m\]@\h \[\e[0;32m\]\w\[\e[0m\]\[\e[0;34m\] \$\[\e[0m\]'
export PS1=$PS0

source ~/.config/sh/aliases
#source ~/.config/sh/functions
source /usr/share/doc/ranger/examples/bash_automatic_cd.sh
source /usr/share/doc/ranger/examples/bash_subshell_notice.sh


# set terminal window title to the name of executed command
# tmux and i3wm usage
case "$TERM" in
    rxvt*|xterm*)
        set -o functrace
        trap '[[ $BASH_SOURCE ]] || printf "\e]0;%s\a" "$BASH_COMMAND" >/dev/tty' DEBUG ;;
esac

#COLORS
#trap "printf '\e[0m'" DEBUG
#export GREP_COLOR='1;36'
#eval $(dircolors -b ~/.dir_colors)
##VARIOUS
#export HISTSIZE=1000
#export HISTFILESIZE="${HISTSIZE}"
#export HISTCONTROL="ignoreboth:erasedups"
#shopt -s cdspell dirspell extglob histverify no_empty_cmd_completion expand_aliases checkwinsize
#
##MAN
## Colored "man" pages, comment out if using rxvt-unicode with the colored man pages option enabled.See man 5 termcap
#man() {
#	env \
#		LESS_TERMCAP_mb=$(printf "\e[0;34m") \
#		LESS_TERMCAP_md=$(printf "\e[0;34m") \
#		LESS_TERMCAP_me=$(printf "\e[0m") \
#		LESS_TERMCAP_se=$(printf "\e[0m") \
#		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
#		LESS_TERMCAP_ue=$(printf "\e[0m") \
#		LESS_TERMCAP_us=$(printf "\e[1;32m") \
#			man "$@"
#}

##EXTRACT
#extract () {
#if [ -f $1 ] ; then
#export TERM=xterm-256color
#export EDITOR=vim
#case $1 in
#*.lrz) lrztar -d $1 && cd $(basename "$1" .lrz) ;;
#*.tar.bz2) tar xvjf $1 && cd $(basename "$1" .tar.bz2) ;;
#*.tar.gz) tar xvzf $1 && cd $(basename "$1" .tar.gz) ;;
#*.tar.xz) tar Jxvf $1 && cd $(basename "$1" .tar.xz) ;;
#*.bz2) bunzip2 $1 && cd $(basename "$1" /bz2) ;;
#*.rar) unrar x $1 && cd $(basename "$1" .rar) ;;
#*.gz) gunzip $1 && cd $(basename "$1" .gz) ;;
#*.tar) tar xvf $1 && cd $(basename "$1" .tar) ;;
#*.tbz2) tar xvjf $1 && cd $(basename "$1" .tbz2) ;;
#*.tgz) tar xvzf $1 && cd $(basename "$1" .tgz) ;;
#*.zip) unzip $1 && cd $(basename "$1" .zip) ;;
#*.Z) uncompress $1 && cd $(basename "$1" .Z) ;;
#*.7z) 7z x $1 && cd $(basename "$1" .7z) ;;
#*) echo "don't know how to extract '$1'..." ;;
#esac
#else
#echo "'$1' is not a valid file!"
#fi
#}


