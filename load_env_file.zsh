#!/usr/bin/env zsh

load_env_file() {
  local env_file="$1"

  if [ ! -f "$env_file" ]; then
    echo "File not found: $env_file"
    return 1
  fi

  set -a
  source "$env_file"
  set +a
}

# Usage example:
# load_env_file .env
