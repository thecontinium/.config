# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

export PYENV_ROOT=${XDG_CACHE_HOME}/pyenv 
path=("$PYENV_ROOT/bin:$PATH" $path)
export PATH
# Added to enable shims and autocompletion for pyenv installed through homebrew  
if which pyenv > /dev/null; then eval "$(pyenv init --path)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
