#!/usr/bin/env zsh

(&>/dev/null defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true &)
(&>/dev/null defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true &)
