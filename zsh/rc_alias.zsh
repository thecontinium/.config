# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

if is_mac; then
    alias ql='qlmanage -p 2>/dev/null' # OS X Quick Look
    alias oo='open .' # open current dir in OS X Finder
fi
alias clr='clear'
alias s_http='python -m SimpleHTTPServer' # serve current folder via HTTP
alias s_smtp='python -m smtpd -n -c DebuggingServer localhost:1025' # SMTP test server, outputs to console
alias wget='wget --no-check-certificate'
alias pinst='sudo python setup.py install && sudo rm -r build && sudo rm -r dist && sudo rm -r *egg-info' # install a Python package
alias beep='echo -n "\a"'

# A quick way to get out of current directory
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

# Use GNU ls on macOS instead of BSD
hash gls 2>/dev/null && LS="gls" || LS="ls"

# Listing directory contents
alias ls='LC_COLLATE=C '$LS' --color=auto --group-directories-first'
alias l='ls -CFa'
alias ll='ls -alF'
alias lsd='ls -Gal | grep ^d'
alias la='ls -la'
alias lst="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'"
unset LS

hash gdircolors 2>/dev/null && alias dircolors=gdircolors
hash gsort 2>/dev/null && alias sort=gsort

# Head and tail will show as much possible without scrolling
hash ghead 2>/dev/null && alias h='ghead -n $((${LINES:-12}-4))'
hash gtail 2>/dev/null && alias t='gtail -n $((${LINES:-12}-4)) -s.1'
