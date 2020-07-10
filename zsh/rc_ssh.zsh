# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

## link the ssh config to the one in keys
! [[ -h ~/.ssh/config ]] && [[ -a ~/.ssh/keys/config ]] && ln -sf ~/.ssh/keys/config ~/.ssh/config

## add home_key to authorized_keys if it is not there alreadtestingy
home_key="{{ HOME_KEY }}"
if [[ -f ~/.ssh/keys/${home_key}.pub ]]; then
  umask 0077
  mkdir -p ~/.ssh
  touch ~/.ssh/authorized_keys
  ! test $(grep -F -f ~/.ssh/keys/${home_key}.pub ~/.ssh/authorized_keys) && cat ~/.ssh/keys/${home_key}.pub >> ~/.ssh/authorized_keys
fi

## Use keychain to persist keys
# https://github.com/funtoo/keychain
if hash keychain 2>/dev/null; then
  # eval "$(keychain --dir "$XDG_CACHE_HOME/keychain" --eval --agents ssh -Q --quiet current)"
  # cache the public keys every 24 hours
  cached_public_keys="$XDG_CACHE_HOME/keys"
  (! [[ -f $cached_public_keys ]] || test $(find $cached_public_keys -mtime 1)) && ls -m ~/.ssh/keys/*.pub | tr ',\n' ' ' | sed 's/.pub //g' > $cached_public_keys
  public_keys=$(cat $cached_public_keys)
  cmd="keychain --dir ${XDG_CACHE_HOME}/keychain --eval --agents ssh --quiet ${public_keys}"
  eval $(eval "${cmd}")
fi
