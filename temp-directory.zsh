#!/usr/bin/env zsh

function cdtemp {
  local dir="$(mktemp --directory)"
  cd "$dir"
}
