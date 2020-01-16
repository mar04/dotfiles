#!/bin/sh

# XDG ------------------------------------------------------------------------
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"


# DEFAULT APPS ---------------------------------------------------------------
export BROWSER="firefox"
export EDITOR="nvim"
export PAGER="less"
export VISUAL="$EDITOR"


# ATOM -----------------------------------------------------------------------
export ATOM_HOME="$XDG_DATA_HOME/atom"
# BASH -----------------------------------------------------------------------
export HISTCONTROL="ignoreboth:erasedups"
export HISTFILE="$XDG_DATA_HOME/bash/history"
export HISTFILESIZE="10000"
# export HISTIGNORE="ls:bg:fg:history"
export HISTSIZE="10000"
export HISTTIMEFORMAT="%F %T "
export PROMPT_COMMAND='history -a' #save history always
# CCACHE ---------------------------------------------------------------------
export CCACHE_DIR="/mnt/LINDATA/ccache"
export CCACHE_MAXSIZE="32G"
export CCACHE_COMPRESS="1"
# CHROMIUM -------------------------------------------------------------------
# export CHROMIUM_USER_FLAGS="--disk-cache-size=2000000 --ppapi-flash-path=/usr/lib/PepperFlash/libpepflashplayer.so --ppapi-flash-version=14.0.0.125"
# DVDCSS ---------------------------------------------------------------------
export DVDCSS_CACHE="$XDG_CACHE_HOME/dvdcss"
# FIREFOX --------------------------------------------------------------------
# export MOZ_USE_XINPUT2=1
# FZF ------------------------------------------------------------------------
export FZF_DEFAULT_COMMAND="fd --hidden"
export FZF_DEFAULT_OPTS="--exact"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d"
# GO -------------------------------------------------------------------------
export GOPATH="$HOME/projects/code/go"
# GPG ------------------------------------------------------------------------
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"
export GPG="$(tty)"
export GTK_OVERLAY_SCROLLING=0
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/gnupg/S.gpg-agent.ssh"
# HTTPIE ---------------------------------------------------------------------
export HTTPIE_CONFIG_DIR="$XDG_CONFIG_HOME/httpie"
# ICEAUTH --------------------------------------------------------------------
# export ICEAUTHORITY="$XDG_RUNTIME_DIR/ICEauthority"
# JAVA -----------------------------------------------------------------------
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=lcd"
# LESS -----------------------------------------------------------------------
export LESS="-FRi"
export LESSHISTFILE="/dev/null"
# LYX ------------------------------------------------------------------------
export LYX_USERDIR_23x="$XDG_CONFIG_HOME/lyx"
# MEDNAFEN -------------------------------------------------------------------
export MEDNAFEN_HOME="$XDG_CONFIG_HOME/mednafen"
# NPM ------------------------------------------------------------------------
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
# PYTHON ---------------------------------------------------------------------
#export PYTHONOPTIMIZE="2"
# export PYTHONSTARTUP="$XDG_CONFIG_HOME/python_startup.py"
export PYLINTHOME="$XDG_CACHE_HOME/pylint.d"
export IPYTHONDIR="$XDG_CONFIG_HOME/jupyter"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
# QT -------------------------------------------------------------------------
# export QT_LOGGING_RULES="*=false"
# export QT_STYLE_OVERRIDE="gtk"
# RANGER ---------------------------------------------------------------------
export RANGER_LOAD_DEFAULT_RC="FALSE"
# READLINE -------------------------------------------------------------------
export INPUTRC="$XDG_CONFIG_HOME/sh/inputrc"
# RUST -----------------------------------------------------------------------
# export CARGO_HOME="$XDG_DATA_HOME/cargo"
# export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
# _RUST="$RUSTUP_HOME/toolchains/stable-x86_64-unknown-linux-gnu"
# export RUST_SRC_PATH="$_RUST/lib/rustlib/src/rust/src"
# export MANPATH="$(manpath):$_RUST/share/man:$XDG_DATA_HOME/man"
# LIBREOFFICE ----------------------------------------------------------------
export SAL_USE_VCLPLUGIN="gtk3_kde5"
# SCREEN ---------------------------------------------------------------------
export SCREENRC="$XDG_CONFIG_HOME/screen/screenrc"
# SDDM -----------------------------------------------------------------------
# export DESKTOP_LOCKED=yes
# SDL ------------------------------------------------------------------------
# export SDL_AUDIODRIVER="alsa"
# VAAPI ----------------------------------------------------------------------
export LIBVA_DRIVER_NAME="iHD"
export GST_VAAPI_ALL_DRIVERS=1
# VDPAU ----------------------------------------------------------------------
# export VDPAU_DRIVER="va_gl"
# VULKAN ----------------------------------------------------------------------
# export VK_ICD_FILENAMES="/usr/share/vulkan/icd.d/nvidia_icd.json"
# WINE -----------------------------------------------------------------------
# export WINEARCH="win32"
export WINEDEBUG="-all"
# XAUTH ----------------------------------------------------------------------
# export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"


# PATH -----------------------------------------------------------------------
PATH="$GOPATH/bin:$PATH"
# PATH="`ruby -e 'puts Gem.user_dir'`/bin:$PATH"
# PATH="$HOME/.local/android-studio/bin:$PATH"
# PATH="$CARGO_HOME/bin:$PATH"
export PATH="$HOME/bin:$PATH"


# SHELL ----------------------------------------------------------------------
# if [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] ; then
#     startx
#     exit
# fi


# vim: tw=78 cc=+1
