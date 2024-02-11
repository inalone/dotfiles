autoload -U compinit; compinit

HISTFILE=~/.zsh_history
HISTSIZE=25000
SAVEHIST=25000
bindkey -e

# prompt
## git prompt
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:git*' formats "[%b] "
precmd() {
    vcs_info
}

## actual prompt
setopt prompt_subst
PROMPT='${vcs_info_msg_0_}%F{green}%n@%m%F{reset}:%F{blue}%~%F{reset}$ '
