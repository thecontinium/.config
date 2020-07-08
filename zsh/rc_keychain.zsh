# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

## link the ssh config to the one in keys
! [[ -h ~/.ssh/config ]] && [[ -a ~/.ssh/keys/config ]] && ln -sf ~/.ssh/keys/config ~/.ssh/config

## Use keychain to persist keys
# https://github.com/funtoo/keychain
if hash keychain 2>/dev/null; then
  # eval "$(keychain --dir "$XDG_CACHE_HOME/keychain" --eval --agents ssh -Q --quiet current)"
  public_keys=$(ls -m ~/.ssh/keys/*.pub | tr ',\n' ' ' | sed 's/.pub //g' )
  cmd="keychain --dir ${XDG_CACHE_HOME}/keychain --eval --agents ssh --quiet ${public_keys}"
  eval $(eval "${cmd}")
fi
