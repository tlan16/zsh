#!/usr/bin/env zsh

function brew-cleanup-all {
  brew autoremove
  brew cleanup --prune=all
}


if [ -f "/opt/homebrew/bin/brew" ] ; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -f "/home/linuxbrew/.linuxbrew/bin/brew" ] ; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

if [ -d "/opt/homebrew/bin" ] ; then
  export PATH="/opt/homebrew/bin:$PATH"
fi
if [ -d "/home/linuxbrew/.linuxbrew/bin" ] ; then
  export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
fi

if [ -d "/opt/homebrew/sbin" ] ; then
  export PATH="/opt/homebrew/sbin:$PATH"
fi
if [ -d "/home/linuxbrew/.linuxbrew/sbin" ] ; then
  export PATH="/home/linuxbrew/.linuxbrew/sbin:$PATH"
fi

if [ -d "/opt/homebrew" ] ; then
  alias brew-install-from-source="brew install --build-from-source"
  alias brew-outdated-formula="brew outdated --formula"
  alias brew-upgrade-all-formula='brew outdated --formulae | xargs -I{} brew reinstall --build-from-source {}'
  alias brew-remove-lock="$(brew --prefix)/var/homebrew/locks"
fi
