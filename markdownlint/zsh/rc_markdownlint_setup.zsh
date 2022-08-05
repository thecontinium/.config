# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

# To make tmuxp use the correct configuration file for tmux we need to hard wire
# the default location for tmux.
# We do this if the .tmux.conf file does not exist in out home directory
! [[ -a  $HOME/.markdownlintrc ]] && ln -s $XDG_CONFIG_HOME/markdownlint/.markdownlint.yaml $HOME/.markdownlintrc

