# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

local -A ZINIT   # initial Zinits hash definition, then:
ZINIT[HOME_DIR]=${XDG_CACHE_HOME}/zinit
ZINIT[BIN_DIR]=$ZINIT[HOME_DIR]/bin
ZINIT[ZCOMPDUMP_PATH]=${XDG_CACHE_HOME}/zinit/.zcompdump
ZINIT[COMPINIT_OPTS]="-C"

# Check if zinits is installed

if [[ ! -d $ZINIT[HOME_DIR] ]]; then
   mkdir $ZINIT[HOME_DIR]
   git clone https://github.com/zdharma/zinit.git $ZINIT[BIN_DIR]
fi

### Added by Zinit's installer
source $ZINIT[BIN_DIR]/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

