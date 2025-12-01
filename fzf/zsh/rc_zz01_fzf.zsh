# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

# fzf completions using fd
_fzf_compgen_path() { fd . "$1"; }
_fzf_compgen_dir()  { fd --type d . "$1"; }

# Set up fzf key bindings and fuzzy completion
# this is sourcd last to endure ** completion works
source <(fzf --zsh)
