#!/usr/bin/env zsh

function zi-update-all {
  zi update --parallel "$(nproc)"
}
