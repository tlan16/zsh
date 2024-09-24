#!/usr/bin/env zsh

function zinit-update-all {
  zinit update --parallel "$(nproc)"
  source ~/.zshrc
}
