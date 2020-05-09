#!/bin/zsh
if [[ ! -f /etc/zshenv ]] ; then
  echo "Adding zshenv to /etc so that ZDOTROOT is set correctly. This only needs to be done once"
  sudo cp $HOME/.config/zsh/zshenv /etc/zshenv
fi
echo "Setup"
