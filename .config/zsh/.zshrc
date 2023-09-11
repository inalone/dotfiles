if [ "$(tty)" = "/dev/tty1" ]; then
	exec startx
fi

source "$ZDOTDIR/history.zsh"
source "$ZDOTDIR/.zsh-aliases"
source "$ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$ZDOTDIR/plugins/zsh-completions/zsh-completions.plugin.zsh"
source "$ZDOTDIR/plugins/git-prompt.zsh/git-prompt.zsh"

PROMPT=$'$(gitprompt)[%F{6}%d%{\e[0m%}]%F{reset}$ '

bindkey -e
unsetopt HIST_VERIFY

autoload -Uz compinit
compinit
