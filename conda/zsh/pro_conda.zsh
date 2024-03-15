# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

if which conda > /dev/null; then eval "$(conda "shell.$(basename "${SHELL}")" hook)"; fi
