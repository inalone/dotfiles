export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=50000
export SAVEHIST=10000

setopt hist_ignore_all_dups
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_verify            # show command with history expansion to user before running it
