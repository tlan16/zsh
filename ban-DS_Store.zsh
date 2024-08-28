#!/usr/bin/env zsh

defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true > /dev/null 2>&1 &
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true > /dev/null 2>&1 &
