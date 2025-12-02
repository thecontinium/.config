# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

agf() {
  local pattern="$1"
  local dir="${2:-.}"

  [[ -z "$pattern" ]] && { echo "Usage: agf <pattern> [dir]"; return 1; }

  ag --nobreak --nonumbers --noheading --files-with-matches "$pattern" "$dir" | fzf
}
