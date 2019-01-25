cd ~/Library/LaunchAgents
launchctl unload -w xdg.environment.plist
launchctl unload -w zsh.environment.plist
launchctl unload -w config.zsh.environment.plist
rm xdg.environment.plist
rm zsh.environment.plist
rm config.zsh.environment.plist
