#!/usr/bin/env zsh

function compress-parquet-files {
  find . -type f -name '*.parquet' -print0 | while IFS= read -r -d '' file; do
    tmpfile="${file}.tmp"
    duckdb -c "COPY (SELECT * FROM read_parquet('$file')) TO '$tmpfile' (FORMAT PARQUET, COMPRESSION 'zstd', COMPRESSION_LEVEL 22);" && mv -f "$tmpfile" "$file"
  done
}
