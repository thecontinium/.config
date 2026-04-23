# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

# Added to enable shims and autocompletion for mise installed through homebrew  
if which mise > /dev/null; then eval "$(mise activate zsh)"; fi
