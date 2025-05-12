# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

alias start='{ test -f ".tmuxp.*" && tmuxp load -y .; } || { tmuxp load -y $(tmuxp ls | fzf) ; }'
