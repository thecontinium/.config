# https://github.com/samoshkin/dotfiles/blob/master/fzf/fzf.rc.sh
# Universal preview function for FZF
_fzf_preview() {
  local tgt="$1"

  if [ -d "$tgt" ]; then
    tree -C -L 2 "$tgt"
  elif [ -f "$tgt" ]; then
    bat -f --style=numbers "$tgt"
  else
    file "$tgt"
  fi
}

_fzf_open_in_editor() {
  "$EDITOR" "$1"
}
# Base commands
export FZF_DEFAULT_COMMAND="git ls-files --cached --others --exclude-standard 2>/dev/null || fd --type f --type l $FD_OPTIONS"

export FZF_DEFAULT_OPTS="\
  --no-mouse \
  --height 80% \
  --cycle \
  --no-scrollbar \
  --border=none \
  --marker=+ \
  --reverse \
  --multi \
  --info=inline \
  --preview='_fzf_preview {}' \
  --preview-window='right:60%:wrap,<50(bottom,50%)' \
  --history=$XDG_CACHE_HOME/.fzf_history --history-size=50 \
  --bind='ctrl-b:execute(bat --style=numbers {} || less -f {})' \
  --bind='ctrl-e:execute(_fzf_open_in_editor {})'
  --bind='alt-w:toggle-preview-wrap' \
  --bind='ctrl-u:half-page-up' \
  --bind='ctrl-x:execute(rm -i {+})+abort' \
  --bind='ctrl-l:clear-query+first' \
  --bind='ctrl-y:execute-silent(echo {+} | pbcopy)+abort' \
  --bind='ctrl-\:change-preview-window(hidden|bottom,50%|right:60%)'"

# CTRL-T
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview='_fzf_preview {}'"

# CTRL-R
export FZF_CTRL_R_OPTS="
  --height 60%
  --preview-window='bottom:3:wrap:border-top,<50(bottom:3:wrap:border-top)'
  --with-nth '2..'
  --preview 'echo {2..}'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --bind 'change:first'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

# export FZF_COMPLETION_TRIGGER='~~'
