# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

# https://stackoverflow.com/questions/21652242/git-re-checkout-files-after-creating-smudge-filter
alias reattr = !sh -c "\"git stash save; rm .git/index; git checkout HEAD -- \\\"$(git rev-parse --show-toplevel)\\\"; git stash pop\""
