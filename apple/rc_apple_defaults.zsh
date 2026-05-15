# Output the file name if it is executed at logingAgjj
[[ -v  CONFIG_ZSH_SHOW_EXECUTING ]] && [[ $- == *i* ]] && echo now executing ${(%):-%N}

if is_mac; then
  # this belongs is an apple launchctl
  # defaults write com.apple.ScreenSharing DoNotSendSystemKeys -bool No
fi
