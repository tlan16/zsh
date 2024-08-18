#!/usr/bin/env zsh

function apple-fs-compress {
  afsctool -c -v -T ZLIB -9 $@
}
