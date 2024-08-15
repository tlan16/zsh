#!/usr/bin/env zsh

function brew-cleanup-all {
  brew cleanup --prune=all
}

if [ -d "/opt/homebrew/bin" ] ; then
  export PATH="/opt/homebrew/bin:$PATH"
fi
if [ -d "/opt/homebrew/sbin" ] ; then
  export PATH="/opt/homebrew/sbin:$PATH"
fi

alias brew-install-from-source="brew install --build-from-source"
