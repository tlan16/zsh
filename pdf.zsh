#!/usr/bin/env zsh

function unlock_pdf() {
  local temp_file
  for input_file in "$@"; do
    temp_file=$(mktemp)
    if [ ! -f "$input_file" ]; then
      echo "Skipped not existing file ${input_file}"
      continue
    fi
    printf "Unlocking %s ..." "$input_file"
    qpdf --decrypt "$input_file" "$temp_file"
    mv "$temp_file" "$input_file"
    printf " done\n"
  done
}
