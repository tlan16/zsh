function git-change-author-frank {
  local name="Frank Lan"
  local email="franklan118@gmail.com"
  FILTER_BRANCH_SQUELCH_WARNING=1 git filter-branch -f --env-filter "GIT_AUTHOR_NAME='${name}'; GIT_AUTHOR_EMAIL='${email}'; GIT_COMMITTER_NAME='${name}'; GIT_COMMITTER_EMAIL='${email}';" HEAD
  git config user.name "${name}"
  git config user.email "${email}"
}
