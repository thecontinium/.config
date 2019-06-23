#!/bin/zsh
local CONFIG_ZSH_DRY_RUN=1
for startup_file in zshenv zprofile zshrc zlogin zlogout; do echo “—-$startup_file—-“; source $ZDOTDIR/.$startup_file ; done



