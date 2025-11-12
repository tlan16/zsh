#!/usr/bin/env zsh

function compress-parquet-files {
  find . -type f -name '*.parquet' -print0 | while IFS= read -r -d '' file; do
    tmpfile="${file}.tmp"
    duckdb -c "COPY (SELECT * FROM read_parquet('$file')) TO '$tmpfile' (FORMAT PARQUET, COMPRESSION 'zstd', COMPRESSION_LEVEL 22);" && mv -f "$tmpfile" "$file"
  done
}

function csv2parquet() {
  if [[ -z "$1" ]]; then
    echo "Usage: csv_to_parquet <csv-file>"
    return 1
  fi
  uvx --with pyarrow csv2parquet --codec zstd "$1"
}
