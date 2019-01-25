cd ~/Library/LaunchAgents
ln -sfv ~/.config/launchctl/xdg.environment.plist
ln -sfv ~/.config/launchctl/zsh.environment.plist
ln -sfv ~/.config/launchctl/config.zsh.environment.plist
launchctl load -w xdg.environment.plist
launchctl load -w xdg.environment.plist
launchctl load -w config.zsh.environment.plist
