# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

# If this is an interactive shell, tmux is installed, and we're not
# already inside a tmux session, then
if [[ $- == *i* ]] && hash tmux 2>/dev/null && [ -z "$TMUX" ]; then
	# If SSH session and not running tmux, list tmux sessions on log-in.
	if [ -n "$SSH_TTY" ]; then
		tmux list-sessions 2>/dev/null | sed 's/^/# tmux /'
	else
		# auto-attach (or new session)
		tmux new-session -A -s main
	fi
fi
