# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

# load the login files
for file in ${(M)CONFIG_ZSH_FILES:#*/lo_*.zsh}
do
  [[ -v CONFIG_ZSH_DRY_RUN ]] && echo ${file:t} || source $file
done
