# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

# To make use the correct configuration file we need to hard wire
# the default location.
#export ATOM_HOME=$XDG_CACHE_HOME/atom
