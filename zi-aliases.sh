#!/usr/bin/env zsh

function zi-update-all {
  zinit update --parallel "$(nproc)"
}
