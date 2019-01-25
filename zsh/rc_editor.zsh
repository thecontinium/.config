# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

if is_mac; then
  export EDITOR='nvim'
else
  export EDITOR='vim'
fi
