# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

autoload colors; colors;
setopt auto_name_dirs
setopt pushd_ignore_dups
setopt prompt_subst
setopt no_beep
setopt auto_cd
setopt multios
setopt cdablevarS
setopt transient_rprompt
setopt extended_glob
autoload -U url-quote-magic
zle -N self-insert url-quote-magic
autoload -U zmv
bindkey "^[m" copy-prev-shell-word
