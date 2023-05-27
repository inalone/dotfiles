export PATH="$HOME/.bin:$HOME/.cargo/bin:$PATH"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# If not running a Wayland display yet, launch sway
if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	~/.bin/startx
fi

parse_git_branch() {
	BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/')

     if [[ -z "$BRANCH" ]] || [[ "$BRANCH" == "[dot]" ]]
     then
	     echo ""
     else
	     echo "$BRANCH"
     fi
}

importWireGuardConnection() {
	CONNECTION_NAME="$1"

	sudo nmcli connection import type wireguard file "$CONNECTION_NAME.conf"
	nmcli connection modify "$CONNECTION_NAME" autoconnect no
}

alias ls='ls --color=auto'
alias audio='ranger ~/Audio'
alias video='ranger ~/Video'

PS1="\[\e[38;5;66m\]\$(parse_git_branch)\[\e[38;5;142m\][\w]\[\e[00m\]$ "
