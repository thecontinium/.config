# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

# add addional history options that yous/vanilla does not add

# Remove extra blanks from each command line being added to history
setopt hist_reduce_blanks

# Allow multiple terminal sessions to all append to one zsh command history
setopt share_history

# Append history to the history file (no overwriting)
setopt append_history

# Include more information about when the command was executed, etc
setopt extended_history

# Add comamnds as they are typed, don't wait until shell exit
setopt inc_append_history

# Remove command lines from the history list when the first character on the line is a space
setopt hist_ignore_space

