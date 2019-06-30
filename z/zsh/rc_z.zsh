# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

[[ -f /usr/local/etc/profile.d/z.sh ]] && source "/usr/local/etc/profile.d/z.sh" && touch $_Z_DATA
