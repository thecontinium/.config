# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

# Set the session ssh-agent socket path (If it's not set)
[ -z "$SSH_AUTH_SOCK" ] && export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent"
