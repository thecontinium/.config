# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

local -A ZPLGM   # initial Zplugins hash definition, then:
ZPLGM[HOME_DIR]=${XDG_CACHE_HOME}/zplugin
ZPLGM[BIN_DIR]=$ZPLGM[HOME_DIR]/bin
ZPLGM[ZCOMPDUMP_PATH]=${XDG_CACHE_HOME}/zplugin/.zcompdump

# Check if zplugin is installed

if [[ ! -d $ZPLGM[HOME_DIR] ]]; then
   mkdir $ZPLGM[HOME_DIR]
   git clone https://github.com/zdharma/zplugin.git $ZPLGM[BIN_DIR]
fi

### Added by Zplugin's installer
source $ZPLGM[BIN_DIR]/zplugin.zsh
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin's installer chunk

