#!bash

# local utility functions
_have() { type "$1" &>/dev/null; }

# environment variables
export REPOS="$HOME/repo"
export DOTFILES="$REPOS/dot"
export SCRIPTS="$DOTFILES/scripts"
export TERM=xterm-256color
export EDITOR=vi
export VISUAL=vi
export EDITOR_PREFIX=vi
export HRULEWIDTH=73

# path
pathappend() {
	declare arg
	for arg in "$@"; do
		test -d "$arg" || continue
		PATH=${PATH//":$arg:"/:}
		PATH=${PATH/#"$arg:"/}
		PATH=${PATH/%":$arg"/}
		export PATH="${PATH:+"$PATH:"}$arg"
	done
} && export -f pathappend

pathprepend() {
	for arg in "$@"; do
		test -d "$arg" || continue
		PATH=${PATH//:"$arg:"/:}
		PATH=${PATH/#"$arg:"/}
		PATH=${PATH/%":$arg"/}
		export PATH="$arg${PATH:+":${PATH}"}"
	done
} && export -f pathprepend

pathprepend \
	"$HOME/.local/bin" \
	/usr/local/bin \
	"$SCRIPTS"

pathappend \
	/usr/bin \
	/snap/bin \
	/sbin \
	/bin

# history
export HISTCONTROL=ignoreboth
export HISTSIZE=5000
export HISTFILESIZE=10000

set -o vi
shopt -s histappend

# prompt
PS1="\e[0;34m\u\e[1;30m@\e[0;35m\h\e[1;30m:\e[0;32m\w\e[m\$ "

# keyboard (requires X and graphic Linux desktop)
_have sexkbmap && test -n "$DISPLAY" &&
	setxkbmap -option caps:escape &> /dev/null
	setxkbmap -layout us,latam -option grp:win_space_toggle

# aliases
unalias -a
alias '?'=duck
alias dot='cd $DOTFILES'
alias scripts='cd $SCRIPTS'
alias ls='ls -h --color=auto'
alias diff='diff --color'
alias more='less'
