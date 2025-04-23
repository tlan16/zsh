#!/usr/bin/env zsh

uuidgen-lower() {
  if ! command -v uuidgen >/dev/null 2>&1; then
    echo "Error: uuidgen is not available" >&2
    return 1
  fi

  uuidgen | tr '[:upper:]' '[:lower:]'
}
