# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

# To make mason lsp server use the correct configuration file 
# We do this if the .Rprofile file does not exist in our home directory
! [[ -a  $HOME/.Rprofile ]] && ln -s $XDG_CONFIG_HOME/R/Rprofile $HOME/.Rprofile

