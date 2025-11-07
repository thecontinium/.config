# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

export MPLBACKEND=module://matplotlib-backend-terminal
export MPLBACKEND_TRANSPARENT=1
export MPLBACKEND_CHAFA_OPTS="-f kitty --passthrough tmux --scale max"
