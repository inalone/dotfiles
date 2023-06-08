export PATH="$HOME/.bin:$HOME/.cargo/bin:$PATH"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# If not running a Wayland display yet, launch sway
if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	~/.bin/startx
fi

getAlbum() {
	ALBUM_FILE="/home/user/Documents/1001-list.txt"
	ALBUM=$(shuf -n 1 "$ALBUM_FILE")
	sed -i "/$ALBUM/d" "$ALBUM_FILE"

	echo "The album is $ALBUM"

	git add "$ALBUM_FILE" > /dev/null
	git commit --amend --no-edit > /dev/null
}

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

alias copyAlbumTemplate='echo "Random 1001 Albums til I finish them all #" | wl-copy'

alias ls='ls --color=auto'
alias markdownPreview='ls *.md | entr -c glow'
alias mpvWebcam='mpv  --profile=low-latency --untimed av://v4l2:/dev/video0'

alias audio='ranger ~/Audio'
alias video='ranger ~/Video'

PS1="\[\e[38;5;66m\]\$(parse_git_branch)\[\e[38;5;142m\][\w]\[\e[00m\]$ "
