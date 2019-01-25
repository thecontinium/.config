# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

#Use zsh from homebrew
#unalias run-help
#autoload run-help
#HELPDIR=/usr/local/share/zsh/helpfiles

source "$ZDOTDIR/.zshuery/zshuery.sh"
#load_defaults
#load_aliases
#load_lol_aliases
#load_completion "$ZDOTDIR/.zshuery/completion"
#load_correction

#prompts '%{$fg_bold[green]%}$(COLLAPSED_DIR)%{$reset_color%}$(virtualenv_info) %{$fg[yellow]%}$(prompt_char)%{$reset_color%} ' '%{$fg[red]%}$(ruby_version)%{$reset_color%}'
#http://www.zsh.org/mla/users/2006/msg00658.html
#source "$ZDOTDIR/.zsh/plugins/zsh-python-prompt/zshrc.zsh"
#LAST_DIR='%10<...<%~'
#LAST_DIR='%3(c:>:)%2c'
#LAST_DIR='%30<...<%3(c:...:)%2c'
#VIM_PROMPT_NORMAL="%{$fg[yellow]%} [% %{$fg_bold[green]%}N%{$fg[yellow]%}]%  %{$reset_color%}"
#VIM_PROMPT_INSERT="%{$fg[yellow]%} [% I]%  %{$reset_color%}"

# set-my-prompt() {
#    prompts '%{$fg_bold[green]%}$LAST_DIR%{$reset_color%}$(virtualenv_info) %{$fg[yellow]%}$(prompt_char)%{$reset_color%} ' '${${KEYMAP/vicmd/$VIM_PROMPT_NORMAL}/(main|viins)/$VIM_PROMPT_INSERT}%{$fg[red]%}$ZSH_PYTHON_PROMPT $(ruby_version)%{$reset_color%}'
#}
#set-my-prompt

#function zle-line-init zle-keymap-select {
#    set-my-prompt
#    zle reset-prompt
#}

#zle -N zle-line-init
#zle -N zle-keymap-select
#export KEYTIMEOUT=1

#if is_mac; then
#  export EDITOR='nvim'
#else
#  export EDITOR='vim'
#fi

# chpwd() {
#   update_terminal_cwd
# }

# Use vi editing keys
#bindkey -v
#bindkey '^?' backward-delete-char
#bindkey '^h' backward-delete-char

# Set up/down arrow key search on history
#autoload -U history-search-end

#zle -N history-beginning-search-backward-end history-search-end
#zle -N history-beginning-search-forward-end history-search-end

#bindkey "\e[A" history-beginning-search-backward-end
#bindkey "\e[B" history-beginning-search-forward-end

# setup hadoop start stop
#alias hstart="/usr/local/Cellar/hadoop/2.6.0/sbin/start-dfs.sh;/usr/local/Cellar/hadoop/2.6.0/sbin/start-yarn.sh"
#alias hstop="/usr/local/Cellar/hadoop/2.6.0/sbin/stop-yarn.sh;/usr/local/Cellar/hadoop/2.6.0/sbin/stop-dfs.sh"

#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

