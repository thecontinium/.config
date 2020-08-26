# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

export JENV_ROOT=${XDG_CACHE_HOME}/jenv
# Added to enable shims and autocompletion for jenv installed through homebrew
export PATH="$JENV_ROOT/bin:$PATH"
eval "$(jenv init -)"
