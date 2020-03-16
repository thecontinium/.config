# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}


# install alien minimal and its dependencies
# zinit load chrissicool/zsh-256color
# zinit load eendroroy/promptlib-zsh
# zinit load eendroroy/alien-minimal


# install pure
zinit ice pick"async.zsh" src"pure.zsh"; zinit light sindresorhus/pure

# Setup OMZ theme

# Load OMZ Git library
#zinit snippet OMZ::lib/git.zsh

# Load Git plugin from OMZ
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit cdclear -q # <- forget completions provided up to this moment

#setopt promptsubst

#zstyle ':prezto:module:prompt' theme minimal
#zinit load mafredri/zsh-async
#zinit ice svn silent; zinit snippet PZT::modules/prompt


#zinit load yous/vanilli.sh
zinit load djui/alias-tips
zinit load zsh-users/zsh-history-substring-search
zinit load zsh-users/zsh-autosuggestions
zinit load zsh-users/zsh-syntax-highlighting
zinit load zdharma/fast-syntax-highlighting

# zinit ice from"notabug"; zinit load zdharma/zui
# zinit light zdharma/zinit-crasis

zinit ice pick"*.*" as"command"; zinit load $XDG_CONFIG_HOME/homebrew/bin/
