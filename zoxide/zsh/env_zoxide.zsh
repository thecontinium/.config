# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

if command -v zoxide 1>/dev/null 2>&1; then
	export _ZO_ECHO=1
	export _ZO_DATA_DIR="$XDG_DATA_HOME"
fi
