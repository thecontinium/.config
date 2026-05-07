
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

# export DYLD_LIBRARY_PATH="$(brew --prefix)/lib:$DYLD_LIBRARY_PATH" 
# just use brew lib for magick as it was messing with bb print-deps --format classpath
alias magick='DYLD_LIBRARY_PATH="$(brew --prefix)/lib" magick'
