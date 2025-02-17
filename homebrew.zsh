#!/usr/bin/env zsh

if [ "$(uname)" = "Darwin" ]; then
  function brew-cleanup-all {
    brew autoremove
    brew cleanup --prune=all
  }
  
  if [ -d "/opt/homebrew/bin" ] ; then
    export PATH="/opt/homebrew/bin:$PATH"
  fi
  if [ -d "/opt/homebrew/sbin" ] ; then
    export PATH="/opt/homebrew/sbin:$PATH"
  fi
  
  if [ -d "/opt/homebrew" ] ; then
    alias brew-install-from-source="brew install --build-from-source"
    alias brew-outdated-formula="brew outdated --formula"
    alias brew-upgrade-all-formula='brew outdated --formulae | xargs -I{} brew reinstall --build-from-source {}'
    alias brew-remove-lock="$(brew --prefix)/var/homebrew/locks"
  fi
fi
