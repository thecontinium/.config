# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

if is_mac; then
  alias ql='qlmanage -p 2>/dev/null' # OS X Quick Look
  alias oo='open .' # open current dir in OS X Finder
fi
alias clr='clear'
alias s_http='python -m SimpleHTTPServer' # serve current folder via HTTP
alias s_smtp='python -m smtpd -n -c DebuggingServer localhost:1025' # SMTP test server, outputs to console
alias wget='wget --no-check-certificate'
alias pinst='sudo python setup.py install && sudo rm -r build && sudo rm -r dist && sudo rm -r *egg-info' # install a Python package
alias beep='echo -n "\a"'

# Lists ---------------------------------------------------- l for list -- {{{

LSCMD='ls'
if is_mac ; then
   # Use GNU tools on OSX instead of BSD
   hash gdircolors 2>/dev/null && alias dircolors='gdircolors'
   hash gfind 2>/dev/null && alias find='gfind'
   hash gsort 2>/dev/null && alias sort='gsort'
   hash gstat 2>/dev/null && alias stat='gstat'
   hash gls 2>/dev/null && LSCMD='gls'
   hash lsd 2>/dev/null && LSCMD='lsd'
fi

alias ls="LC_COLLATE=C ${LSCMD} --color=auto --group-directories-first"
unset LSCMD
alias l='ls -Fa'
alias ll='ls -alF'
# alias lsd='ls -Gal | grep ^d'
alias la='ls -la'
alias lst="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'"
alias llh='ls -alFh'
alias lld='ll | grep "^d" --colour=never'
# }}}
# Editor --------------------------------------------------- e for edit -- {{{
alias e='tmux split-window -h "$EDITOR"'

# Neo/vim shortcuts, use Neovim by default
if hash nvim 2>/dev/null; then
   alias vim=nvim
   alias vless="nvim -u $PREFIX/share/nvim/runtime/macros/less.vim"
   alias suvim='sudo -E nvim'
else
  alias vless="vim -u $PREFIX/share/vim/vim74/macros/less.vim"
  alias suvim='sudo -E vim'
fi

alias v='vim $(fzf)'
alias vi=vim
alias vimdiff='vim -d'
alias testvim="VIMINIT='let \$MYVIMRC=\"\$HOME/box/testvim/init.vim\" | source \$MYVIMRC' nvim"

# }}}
# Grepping ------------------------------------------------- p for grep -- {{{
if hash rg 2>/dev/null; then
   # Use https://github.com/BurntSushi/ripgrep by default
   alias p=rg
elif hash ag 2>/dev/null; then
   # Fallback to https://github.com/ggreer/the_silver_searcher
   alias p=ag
else
   # Fallback to slow grep
   alias p=grep
fi

# Productive defaults for grep and tree
alias grep='grep --color=auto --exclude-dir=.git'
alias tree='tree -F --dirsfirst -a -I ".git|.hg|.svn|__pycache__|.mypy_cache|.pytest_cache|*.egg-info|.sass-cache|.DS_Store" --ignore-case'

# Head and tail will show as much possible without scrolling
hash ghead 2>/dev/null && alias h='ghead -n $((${LINES:-12}-4))'
hash gtail 2>/dev/null && alias t='gtail -n $((${LINES:-12}-4)) -s.1'

# Use colordiff by default
hash colordiff 2>/dev/null && alias diff=colordiff

# }}}
# Explorer --------------------------------------------- = for explorer -- {{{

if hash lf 2>/dev/null; then
# Use https://github.com/gokcehan/lf by default
   = () { lf; }
elif hash ranger 2>/dev/null; then
   # Fallback to https://github.com/ranger/ranger
   = () { ranger; }
fi

# Easier directory navigation
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias -- -="cd -"

# }}}
# Jump around ------------------------------------------- z for jumping -- {{{
alias cdfz='cd "$(dirname "$(fzf)")"'

# }}}
# File find ------------------------------------------------ f for find -- {{{
if command -v fzf >/dev/null 2>&1; then
  alias f="fzf"
elif command -v fd >/dev/null 2>&1; then
	alias f="fd $FD_OPTIONS"
else
	alias f='find . -iname '
fi
# }}}
# OS Specific Network and Filesystem ------------------------------------- {{{
# IP addresses
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias iplocal="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"

if is_mac ; then
	alias netinfo="networksetup -listallnetworkservices | sed '1d' | fzf | xargs networksetup -getinfo"
	# alias ipremote=""  # TODO

	# Show active network interfaces
	alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

	# Flush Directory Service cache
	alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

	# Lock the screen (when going Away From Keyboard)
	alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

	# Recursively delete `.DS_Store` files
	alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

	# Empty the Trash on all mounted volumes and the main HDD.
	# Also, clear Apple’s System Logs to improve shell startup speed.
	# Finally, clear download history from quarantine. https://mths.be/bum
	alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; \
		sudo rm -rfv ~/.Trash; \
		sudo rm -rfv /private/var/log/asl/*.asl; \
		sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"
else
	# IP addresses
	alias ipremote="ip route get 1 | awk '{print \$NF;exit}'"

	# Show active network interfaces
	# alias ifactive=""  # TODO

	# Flush Directory Service cache
	# alias flush=""  # TODO

	# Lock the screen (Away From Keyboard)
	# alias afk=""  # TODO
	# alias afk='gnome-screensaver-command --lock'

	# open, pbcopy and pbpaste on Linux
	if [ -z "$(command -v pbcopy)" ]; then
		if [ -n "$(command -v xclip)" ]; then
			alias pbcopy="xclip -selection clipboard"
			alias pbpaste="xclip -selection clipboard -o"
		elif [ -n "$(command -v xsel)" ]; then
			alias pbcopy="xsel --clipboard --input"
			alias pbpaste="xsel --clipboard --output"
		fi
	fi
	if [ -e /usr/bin/xdg-open ]; then
		alias open="xdg-open"
	fi
fi
# }}}
#  vim: set ft=sh fdm=marker ts=2 sw=2 tw=80 noet :
