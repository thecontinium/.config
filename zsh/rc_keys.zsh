# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

# Use vi editing keys 
bindkey -v 
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
# Use jj rather than esc to leave insert mode
bindkey -M viins "jj" vi-cmd-mode

# Set up/down arrow key search on history
# autoload -U history-search-end
autoload -U history-search

# zle -N history-beginning-search-backward-end history-search-end
# zle -N history-beginning-search-forward-end history-search-end

# bindkey "\e[A" history-beginning-search-backward-end
# bindkey "\e[B" history-beginning-search-forward-end
bindkey "\e[A" history-beginning-search-backward
bindkey "\e[B" history-beginning-search-forward
