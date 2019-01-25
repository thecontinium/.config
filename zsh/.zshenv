# uncomment the line below to stop any output being printed by each file that is sourced
unset CONFIG_ZSH_SHOW_EXECUTING

# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

# system-wide environment settings for zsh(1)
if [ -x /usr/libexec/path_helper ]; then
	eval `/usr/libexec/path_helper -s`
fi

# all of our zsh files ordering by the base file name so that they are not
# ordered by the directory structure
typeset -U config_files
export CONFIG_ZSH_FILES=($XDG_CONFIG_HOME/***/*.zsh(oe['REPLY=${REPLY:t}']))


# load the env files
for file in ${(M)CONFIG_ZSH_FILES:#*/env_*.zsh}
do
  [[ -v CONFIG_ZSH_DRY_RUN ]] && echo ${file:t} || source $file
done


