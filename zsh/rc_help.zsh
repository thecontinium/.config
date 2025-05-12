# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

#Use zsh from homebrew
(( ${+aliases[run-help]} )) && unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/helpfiles

export PAGER=less
export LESS="-FiQMXR"

