# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

# "sharkdp/fd" file finder, modern replacement for GNU find
export FD_OPTIONS="--hidden --follow --ignore-file $XDG_CONFIG_HOME/fd/.ignore"
