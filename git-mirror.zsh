#!/usr/bin/env zsh

git-mirror() {
  local uuid dir repo1 repo2
  uuid=$(uuidgen)
  dir=/tmp/$uuid
  repo1=$1
  repo2=$2

  echo "[INFO ] Started: $repo1 -> $repo2"

  git clone --bare $repo1 $dir
  cd "$dir" || exit 1
  git push --mirror --force $repo2
  cd /tmp || exit 1
  rm -rf "$dir"
}
