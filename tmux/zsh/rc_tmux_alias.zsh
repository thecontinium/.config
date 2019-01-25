# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

# XDG conformity
alias tmux='tmux -f "$XDG_CONFIG_HOME/tmux/tmux.conf"'
