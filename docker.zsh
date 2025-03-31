#!/usr/bin/env zsh

function docker-kill-all {
  # shellcheck disable=SC2046
  docker kill $(docker container ls -q) > /dev/null 2>&1 || true
  docker container prune --force > /dev/null 2>&1 || true
  docker volume prune --force > /dev/null 2>&1 || true
}

if [ -d "$HOME/.docker/bin" ] ; then
  export PATH="${PATH}:${HOME}/.docker/bin"
fi

if [ -d "$HOME/.docker/completions" ] ; then
  fpath=("$HOME/.docker/completions" $fpath)
fi
