# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}
# Stop the /etc startup files from running
# There is no /etc/zshenv so none are run
setopt noglobalrcs
# system-wide environment settings for zsh(1)
# in effect sets path to be /etc/paths
if [ -x /usr/libexec/path_helper ]; then
	eval `/usr/libexec/path_helper -s`
fi

export PREFIX=/usr/local
