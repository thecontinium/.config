# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

vs() {
	local file='' prompt='(Choose session): ' header='────────────'

	file=$(gfind "$HOME/Resilio Sync/app/vim/session" -type f -printf '%Cs %f\n' \
				| sed 's/\.vim$//g' \
				| sort -r \
				| awk "{print \$2}" \
				| fzf -0 --no-multi --no-sort --prompt="$prompt" --header="$header")

	if [ -n "$file" ] && [ "$?" = "0" ]; then
		nvim -S "$HOME/Resilio Sync/app/vim/session/${file}.vim"
	else
		echo 'nothing selected, abort'
	fi
}
