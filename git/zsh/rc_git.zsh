# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

# make reattr a function that calls our overide funcion
zinit ice fbin"reattr"; zinit load ${XDG_CONFIG_HOME}/git/bin/
