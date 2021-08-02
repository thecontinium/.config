# Output the file name if it is executed at login
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

export ONE_WRITER_ICLOUD_DIR="${HOME}/Library/Mobile Documents/9CR7T2DMDG~com~ngocluu~onewriter/Documents"
export ZK_NOTEBOOK_DIR="${ONE_WRITER_ICLOUD_DIR}/notesy"
