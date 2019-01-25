# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

#Use zsh from homebrew
unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/helpfiles

# set nice man pages
if command -v most > /dev/null 2>&1; then
    export PAGER="most"
fi

