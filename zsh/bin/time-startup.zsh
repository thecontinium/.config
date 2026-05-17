#!/bin/zsh
zmodload zsh/zprof
if [[ ! -f /etc/zshenv ]]
then
  echo "Run setup first"
else
  echo “—-/etc/—-“; source /etc/zshenv
  for startup_file in zshenv zprofile zshrc zlogin zlogout; do echo “—-$startup_file—-“; source $ZDOTDIR/.$startup_file ; done
fi
zprof
