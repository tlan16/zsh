#!/usr/bin/env zsh

function docker-kill-all {
  docker kill $(docker container ls -q) > /dev/null 2>&1 || true
  docker container prune --force > /dev/null 2>&1 || true
}

if [ -d "$HOME/.docker/bin" ] ; then
  export PATH="${PATH}:${HOME}/.docker/bin"
fi
