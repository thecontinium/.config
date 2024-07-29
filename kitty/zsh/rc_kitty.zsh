
# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

kitty_term_info_dir="/Applications/kitty.app/Contents/Resources/kitty/terminfo"
[[ -d "$kitty_term_info_dir" ]] && ! [[ -f "$TERMINFO"/kitty.terminfo ]] && cp -nr "$kitty_term_info_dir"/* "$TERMINFO"

