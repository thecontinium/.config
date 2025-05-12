# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

## link the ssh config to the one in keys
! [[ -h ${HOME}/.ssh/config ]] && [[ -a ${HOME}/.ssh/keys/config ]] && ln -sf ${HOME}/.ssh/keys/config ${HOME}/.ssh/config && chmod 600 ${HOME}/.ssh/keys/config

## add home_key to authorized_keys if it is not there already or home_key is
## newer than the authorized
home_key="{{ HOME_KEY }}"
home_public_key="${HOME}/.ssh/keys/${home_key}.pub"
if [[ -f ${home_public_key} ]]; then
  ! [[ -f ${HOME}/.ssh/authorized_keys ]] && touch ${HOME}/.ssh/authorized_keys
  (! test "$(grep -F -f ${home_public_key} ${HOME}/.ssh/authorized_keys)" || [[ ${home_public_key} -nt ${HOME}/.ssh/authorized_keys ]] ) && cat ${home_public_key} >> ${HOME}/.ssh/authorized_keys
fi

# cache the public keys every 24 hours
cached_public_keys="$XDG_CACHE_HOME/keys"
if (! [[ -f $cached_public_keys ]] || test $(find $cached_public_keys -mtime +1)); then
  /bin/ls -m ${HOME}/.ssh/keys/*.pub | tr ',\n' ' ' | sed 's/.pub //g' > $cached_public_keys
  chmod 600 $(cat ${cached_public_keys}) ${HOME}/.ssh/keys/config
  chmod 644 ${HOME}/.ssh/keys/*.pub
  # add them to osx keychain; this will require no input if already added
  echo "Add any new keys to MacOs keychain:"
  for key in $(cat "${cached_public_keys}"); do ssh-add -qK ${key} 2>/dev/null; done
fi

## Use keychain to persist keys https://github.com/funtoo/keychain
if hash keychain 2>/dev/null; then
  # eval "$(keychain --dir "$XDG_CACHE_HOME/keychain" --eval --agents ssh -Q --quiet current)"
  public_keys=$(cat $cached_public_keys)
  cmd="keychain --dir ${XDG_CACHE_HOME}/keychain --eval --agents ssh --quiet ${public_keys}"
  eval $(eval "${cmd}")
fi

# test webhoo# test webhoo# test
