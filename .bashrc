# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

export PATH="~/.local/bin:$PATH"

alias ls='ls --color=auto'

# PS1
display_git_branch() {
	local branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')
	[[ -z "$branch" ]] && echo "" || echo "git:$branch "
}

PS1='$(display_git_branch)[\w]\$ '
. "$HOME/.cargo/env"
