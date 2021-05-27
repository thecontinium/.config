# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

export PYENV_ROOT=${XDG_CACHE_HOME}/pyenv 
path=("$PYENV_ROOT/bin:$PATH" $path)
export PATH
