#!/usr/bin/env zsh

function init-git-archiver {
  mkdir -p scripts
  wget 'https://raw.githubusercontent.com/tlan16/audio-archiver-template/main/scripts/git-adder.sh' --output-document scripts/git-adder.sh
  chmod +x scripts/git-adder.sh
  git add scripts/git-adder.sh
  git commit -m 'add git adder script
  git push
}
