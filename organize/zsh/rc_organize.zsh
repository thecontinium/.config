# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

! [[ -a  $XDG_CONFIG_HOME/organize/config.yaml ]] && ln -s "$HOME/Resilio Sync/share/software/organize/config.yaml" "$XDG_CONFIG_HOME/organize/config.yaml"
