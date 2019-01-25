# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

# load everything but env, login and profile zsh files

for file in ${(M)CONFIG_ZSH_FILES:#*/rc_*.zsh}
do
  [[ -v CONFIG_ZSH_DRY_RUN ]] && echo ${file:t} || source $file
done
