# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

#Where to save history to disk
HISTFILE=$XDG_CACHE_HOME/zsh_history

#How many lines of history to keep in memory
HISTSIZE=5000

#Number of history entries to save to disk
SAVEHIST=5000
