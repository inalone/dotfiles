# if logging in on tty, don't bother loading the prompt stuff - just load sway
if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi

source "$ZDOTDIR/.zsh-aliases"
source "$ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$ZDOTDIR/plugins/zsh-completions/zsh-completions.plugin.zsh"
source "$ZDOTDIR/plugins/git-prompt.zsh/git-prompt.zsh"

PROMPT=$'$(gitprompt)[%F{6}%d%{\e[0m%}]%F{reset}$ '

autoload -Uz compinit
compinit
