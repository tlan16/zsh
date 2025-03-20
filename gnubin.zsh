#!/usr/bin/env zsh

if [ -d "/opt/homebrew/opt/coreutils/libexec/gnubin" ] ; then
  export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
fi
