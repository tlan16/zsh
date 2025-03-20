#!/usr/bin/env zsh

# coreutils
if [ -d "/opt/homebrew/opt/coreutils/libexec/gnubin" ] ; then
  export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
fi

# uutils-coreutils
if [ -d "/opt/homebrew/opt/uutils-coreutils/libexec/uubin" ] ; then
  export PATH="/opt/homebrew/opt/uutils-coreutils/libexec/uubin:$PATH"
fi
