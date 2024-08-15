#!/usr/bin/env zsh

alias git-amend-all="git add . && git commit --amend -C HEAD"

function git-delete-all-branches {
  git for-each-ref --format '%(refname:short)' refs/heads \
  | grep -v 'master|main' \
  | xargs git branch -D
}

function git-config-global-auto-upstream {
  git config --global --add --bool push.autoSetupRemote true
}

function gc1 {
  git clone --depth 1 --filter=blob:none --recurse-submodules -j"$(nproc)" --remote-submodules "$1"
}

function git-change-author-frank {
  local name="Frank Lan"
  local email="franklan118@gmail.com"
  FILTER_BRANCH_SQUELCH_WARNING=1 git filter-branch -f --env-filter "GIT_AUTHOR_NAME='${name}'; GIT_AUTHOR_EMAIL='${email}'; GIT_COMMITTER_NAME='${name}'; GIT_COMMITTER_EMAIL='${email}';" HEAD
  git config user.name "${name}"
  git config user.email "${email}"
}

function git-track-all {
  git remote set-branches origin '*'
  git fetch --all
}
