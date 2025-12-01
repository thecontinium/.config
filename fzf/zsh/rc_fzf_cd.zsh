# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

# Override cd (Alt-C like behavior)
# cd() {
#   if [ $# -gt 0 ]; then
#     builtin cd "$@" || return
#     return
#   fi
#
#   local selected_dir
#   selected_dir=$(fd --type d $FD_OPTIONS | fzf \
#     --no-multi \
#     --height 60% \
#     --preview='_fzf_preview {}')
#
#   [ -n "$selected_dir" ] && builtin cd "$selected_dir"
# }
#
