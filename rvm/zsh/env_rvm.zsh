# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

# Load RVM into a shell session *as a function*
test -f /etc/profile.d/rvm.sh && source /etc/profile.d/rvm.sh
