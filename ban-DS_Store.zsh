#!/usr/bin/env zsh

if [ "$(uname)" = "Darwin" ]; then
  (&>/dev/null defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true &)
  (&>/dev/null defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true &)
fi
