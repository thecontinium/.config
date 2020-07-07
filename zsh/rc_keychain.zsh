# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

## Use keychain to persist keys
# https://github.com/funtoo/keychain
if hash keychain 2>/dev/null; then
  # eval "$(keychain --dir "$XDG_CACHE_HOME/keychain" --eval --agents ssh -Q --quiet current)"
  public_keys=$(cd ~/.ssh; ls -m *.pub | tr ',\n' ' ' | sed 's/.pub //g' )
  cmd="keychain --dir ${XDG_CACHE_HOME}/keychain --eval --agents ssh --quiet ${public_keys}"
  eval $(eval "${cmd}")
fi
