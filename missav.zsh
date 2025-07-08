#!/usr/bin/env zsh

if command -v uvx >/dev/null 2>&1; then
   alias missav_dl="uvx mrjet --url"
elif command -v pipx >/dev/null 2>&1; then
   alias missav_dl="pipx mrjet --url"
else
   echo "Need either uvx or pipx"
fi
