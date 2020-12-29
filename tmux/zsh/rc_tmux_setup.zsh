# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

# XDG conformity - the alias did not work with tmuxp so I am commenting it out
# alias tmux='tmux -f "$XDG_CONFIG_HOME/tmux/tmux.conf"'

# To make tmuxp use the correct configuration file for tmux we need to hard wire
# the default location for tmux.
# We do this if the .tmux.conf file does not exist in out home directory
! [[ -a  $HOME/.tmux.conf ]] && ln -s $XDG_CONFIG_HOME/tmux/tmux.conf $HOME/.tmux.conf

# Make sure that the thumbs plugin is built
tpd="$XDG_CONFIG_HOME/tmux/plugins/thumbs"
if [ -d "$tpd" ] && [ ! -f "$tpd/target/release/thumbs" ]; then
  echo "Building tmux thumbs plugin"
  cd "$tpd" && cargo build --release --target-dir=target
fi
