# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

# To make lein use the correct configuration file we need to hard wire
# the default location.
# We do this if the .lein/project.clj file does not exist in out home directory
! [[ -d $HOME/.lein ]] && mkdir $HOME/.lein
! [[ -a  $HOME/.lein/profiles.clj ]] && ln -s $XDG_CONFIG_HOME/lein/profiles.clj $HOME/.lein/profiles.clj
