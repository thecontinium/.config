# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

if ! toe | grep -q alacritty; then
	 curl https://raw.githubusercontent.com/alacritty/alacritty/master/extra/alacritty.info -so /tmp/alacritty.info
	 tic -xe alacritty,alacritty-direct /tmp/alacritty.info
fi
