# uncomment the line below to stop any output being printed by each file that is sourced
unset CONFIG_ZSH_SHOW_EXECUTING

# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

# XDG directories
# These are setup here so that the following command can be used to connect
# remotely
# ssh -t user@host 'export ZDOTDIR=$HOME/.config/zsh; usr/local/bin/zsh -l'
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_RUNTIME_DIR=/tmp/run

# all of our zsh files ordering by the base file name so that they are not
# ordered by the directory structure
typeset -U config_files
export CONFIG_ZSH_FILES=($XDG_CONFIG_HOME/***/*.zsh(oe['REPLY=${REPLY:t}']))

# load the env files
for file in ${(M)CONFIG_ZSH_FILES:#*/env_*.zsh}
do
  [[ -v CONFIG_ZSH_DRY_RUN ]] && echo ${file:t} || source $file
done


