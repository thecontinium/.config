# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}


# install alien minimal and its dependencies
# zinit load chrissicool/zsh-256color
# zinit load eendroroy/promptlib-zsh
# zinit load eendroroy/alien-minimal


# install pure
zinit ice lucid atload'!prompt_pure_precmd' pick"async.zsh" src"pure.zsh"
zinit load sindresorhus/pure

# Setup OMZ theme

# Load OMZ Git library
#zinit snippet OMZ::lib/git.zsh

# Load Git plugin from OMZ
zinit wait lucid for \
        OMZL::git.zsh \
        OMZP::git
# zinit cdclear -q # <- forget completions provided up to this moment

#setopt promptsubst

#zstyle ':prezto:module:prompt' theme minimal
#zinit load mafredri/zsh-async
#zinit ice svn silent; zinit snippet PZT::modules/prompt

# The following command will make sure that the homebrew completions are added
# to the list of zplugin completions and will in turn call compinit to turn
# completions on and create the .zcompdump file in the location defined by ZPLGM[ZCOMPDUMP_PATH]
# If homebrew is not installed then zpcompinti is called i.e. autoload compinit; compinit (also respecting $ZPLGM[ZCOMPDUMP_PATH])
# has_brew && zinit ice wait lucid blockf  zinit creinstall -q $(brew --prefix)/share/zsh/site-functions

zinit wait'!' lucid for \
  atinit"zicompinit; zicdreplay -q" zdharma/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" zsh-users/zsh-autosuggestions \
  blockf atpull"zinit creinstall -q ." zsh-users/zsh-completions \
  as"completion" https://github.com/alacritty/alacritty/blob/master/extra/completions/_alacritty \
  if"has_brew" blockf atload"zinit creinstall -q ." $(brew --prefix)/share/zsh/site-functions

#zinit load yous/vanilli.sh
# zinit load djui/alias-tips
# zinit load zsh-users/zsh-history-substring-search
# zinit load zsh-users/zsh-syntax-highlighting

# zinit ice from"notabug"; zinit load zdharma/zui
# zinit light zdharma/zinit-crasis

# zinit ice pick"*.*" as"command"; zinit load $XDG_CONFIG_HOME/homebrew/bin/

# || zpcompinit
