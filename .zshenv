export XDG_BIN_HOME="$HOME/.local/bin"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/gcr/ssh"

export EDITOR="nvim"
export ZDOTDIR="$HOME/.config/zsh/"

path+=("$HOME/.local/bin")
path+=("$CARGO_HOME/bin")
export PATH
