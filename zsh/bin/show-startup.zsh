#!/bin/zsh
local CONFIG_ZSH_DRY_RUN=1
[[ ! -f /etc/zshenv ]] && sudo cp $HOME/.config/zshenv /etc/zshenv
echo “—-/etc/—-“; source /etc/zshenv
for startup_file in zshenv zprofile zshrc zlogin zlogout; do echo “—-$startup_file—-“; source $ZDOTDIR/.$startup_file ; done

