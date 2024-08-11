#!/usr/bin/env zsh

git remote set-branches origin '*'

alias git-track-all="git remote set-branches origin '*'"
alias gc1="git clone --depth 1 --filter=blob:none --recurse-submodules -j\"$(nproc)\" --remote-submodules"
alias git-delete-all-branches="git for-each-ref --format '%(refname:short)' refs/heads | grep -v 'master|main' | xargs git branch -D"
