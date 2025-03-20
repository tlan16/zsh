#!/usr/bin/env zsh

if [ -d "$HOME/.cargo/bin" ] ; then
  export PATH="$HOME/.cargo/bin:$PATH"
  if [ -f "$HOME/.cargo/env" ] ; then
    source $HOME/.cargo/env &> /dev/null
  fi
fi
