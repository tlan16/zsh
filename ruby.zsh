#!/usr/bin/env zsh

if [ -d "$HOME/.gem/ruby/3.3.0/bin" ] ; then
  export PATH="$HOME/.gem/ruby/3.3.0/bin:$PATH"
fi
if [ -d "/opt/homebrew/opt/ruby/bin" ] ; then
  export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
fi
