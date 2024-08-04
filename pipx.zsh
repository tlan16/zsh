#!/usr/bin/env bash

if [ -d "/opt/homebrew/opt/grep/libexec/gnubin" ]; then
  export PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"
fi

last_version=$(curl --silent https://api.github.com/repos/pypa/pipx/releases/latest | jq --raw-output '.name' | grep --only-matching --perl-regexp '^\d+\.\d+\.\d+$')
if [ -z "$last_version" ]; then
  exit 0
fi
installed_version=$(pipx --version | grep --perl-regexp --only-matching '^\d+\.\d+\.\d+$')

if [ "$last_version" != "$installed_version" ]; then
  echo "Upgrading pipx from ${installed_version:-uninstalled} to $last_version"
  if [ "$(command -v brew)" ]; then
    brew install pipx
    exit 0
  fi

  if [ "$(command -v pip3)" ]; then
    pip3 install --user --upgrade pipx
  else
    if [ "$(command -v pip)" ]; then
    pip install --user --upgrade pipx
    fi
  fi
fi
