# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

export TMUXP_CONFIGDIR=${XDG_CONFIG_HOME}/tmuxp
