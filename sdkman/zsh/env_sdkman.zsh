# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

# "sharkdp/fd" file finder, modern replacement for GNU find

if brew list --formula sdkman-cli >/dev/null 2>&1; then
  export SDKMAN_DIR="$(brew --prefix sdkman-cli)/libexec"
fi
