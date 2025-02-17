#!/usr/bin/env zsh

if [ "$(uname)" = "Darwin" ]; then
  function flush_dns {
    sudo bash -c "dscacheutil -flushcache; killall -HUP mDNSResponder"
  }
fi
