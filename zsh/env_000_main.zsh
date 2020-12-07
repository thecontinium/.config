# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}
# Stop the /etc startup files from running after /etc/zshenv has run
setopt noglobalrcs
# system-wide environment settings for zsh(1)
# sets path to be those in the file /etc/paths + directories in
# /etc/paths.d
if [ -x /usr/libexec/path_helper ]; then
	eval `/usr/libexec/path_helper -s`
fi

export PREFIX=/usr/local
