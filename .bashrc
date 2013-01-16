#
# .bashrc - interactive shell configuration
#

# check for interactive
[[ $- = *i* ]] || return

shopt -s checkwinsize
shopt -s histappend


PS0='\[\e[0;34m\]\u\[\e[0m\]@\h \[\e[0;32m\]\w\[\e[0m\]\[\e[0;34m\] \$\[\e[0m\]'
PS1=$PS0


PATH=$PATH:/home/mariusz/.local/bin
PATH=$PATH:/mariusz/.local/maple13_installation/bin


BROWSER=links
PAGER=less
EDITOR=vim
VISUAL=$EDITOR


if [ -n "$DISPLAY" ]; then
     BROWSER=chromium
fi


# configure xdg-open

alias startx='startx &> ~/.xlog ; vlock'
alias ls="ls -h --color=auto --group-directories-first"
alias ll="ls -l"
alias lll="ll -ctr"
alias tree="tree -AC"
alias df="df -h"
alias urxvtd="urxvtd -q -o -f"
#alias et="emacsclient -t"
#alias e="emacsclient -c"
alias cal="cal -m3"
alias alarm_enable='PS1="$PS0\a"'
alias alarm_disable='PS1=$PS0'

