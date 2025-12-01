# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

# Put all homebrew casks in the Application Directory 
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Stop Homebrew showinging its emoji 
export HOMEBREW_NO_EMOJI=1

# Hide hints 
export HOMEBREW_NO_ENV_HINTS=1
