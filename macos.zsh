#!/usr/bin/env zsh

function flush_dns {
  sudo bash -c "dscacheutil -flushcache; killall -HUP mDNSResponder"
}
