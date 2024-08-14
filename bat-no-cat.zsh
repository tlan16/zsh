#!/usr/bin/env zsh

if type "bat" > /dev/null; then
  if [ ! -f "$(bat --config-dir)/themes/Catppuccin Mocha.tmTheme" ]; then
    wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme
    bat cache --build
  fi
  if [[ $- == *i* ]]; then # if is interactive
    alias "cat=bat --paging=never"
  fi
fi
