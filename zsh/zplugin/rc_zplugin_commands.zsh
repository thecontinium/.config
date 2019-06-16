# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}


# install alien minimal and its dependencies
# zplugin load chrissicool/zsh-256color
# zplugin load eendroroy/promptlib-zsh
# zplugin load eendroroy/alien-minimal


# install pure
zplugin ice pick"async.zsh" src"pure.zsh"
zplugin light sindresorhus/pure

# Setup OMZ theme

# Load OMZ Git library
#zplugin snippet OMZ::lib/git.zsh

# Load Git plugin from OMZ
#zplugin snippet OMZ::plugins/git/git.plugin.zsh
#zplugin cdclear -q # <- forget completions provided up to this moment

#setopt promptsubst

#zstyle ':prezto:module:prompt' theme minimal
#zplugin load mafredri/zsh-async
#zplugin ice svn silent; zplugin snippet PZT::modules/prompt


#zplugin load yous/vanilli.sh
zplugin load djui/alias-tips
zplugin load zsh-users/zsh-history-substring-search
zplugin load zsh-users/zsh-autosuggestions
zplugin load zsh-users/zsh-syntax-highlighting
zplugin load zdharma/fast-syntax-highlighting

zplugin ice from"notabug"; zplugin load zdharma/zui
zplugin light zdharma/zplugin-crasis

zplugin ice pick"*.*" as"command"; zplugin load $XDG_CONFIG_HOME/homebrew/bin/
