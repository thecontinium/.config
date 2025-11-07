# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# add specific commands we want to use 
zinit ice fbin"setup-notebook-env"; zinit load ${XDG_CONFIG_HOME}/pyenv/bin/
