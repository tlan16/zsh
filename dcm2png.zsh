#!/usr/bin/env zsh

function dcm2png() {
    local input_file=$1
    local output_file=${2:-$input_file.png}

    magick convert \
      "$input_file" \
      -quality 100 \
      -define png:compression-level=0  \
      -define png:compression-filter=5 \
      -define png:compression-strategy=2 \
      "$output_file"
}
