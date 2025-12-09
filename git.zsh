#!/usr/bin/env zsh

alias git-amend-all="git add . && git commit --amend -C HEAD"

function git-delete-all-local-branches {
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

function init-git-archiver {
  mkdir -p scripts
  wget 'https://raw.githubusercontent.com/tlan16/audio-archiver-template/main/scripts/git-adder.sh' --output-document scripts/git-adder.sh
  chmod +x scripts/git-adder.sh
  git add scripts/git-adder.sh
  git commit -m 'add git adder script'
  git push
}

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

git-pull-min () {
  # Default to current branch if not specified
  local branch="${1:-$(git rev-parse --abbrev-ref HEAD)}"

  echo "🔄 Fetching latest commit with depth=1..."
  git fetch --depth=1 origin "$branch" || { echo "❌ Fetch failed"; return 1; }

  echo "↩️ Resetting to origin/$branch..."
  git reset --hard "origin/$branch" || { echo "❌ Reset failed"; return 1; }

  echo "🧹 Expiring reflog and pruning unused objects..."
  git reflog expire --expire=now --all
  git gc --aggressive --prune=now

  echo "✅ Repository minimized successfully!"
}

create-gh-repo() {
  local repo_name="$1"
  local clone_dir="${2:-$repo_name}"
  repo_name="${(L)repo_name}"

  if [[ -z "$repo_name" ]]; then
    echo "Error: Repository name is required." >&2
    return 1
  fi

  if [[ -d "$clone_dir" ]]; then
    echo "Error: Directory '$clone_dir' already exists." >&2
    return 1
  fi

  # Create private repository with issues and wiki disabled (no auto-init)
  if ! gh repo create "$repo_name" \
    --private \
    --disable-issues \
    --disable-wiki; then
    echo "Error: Failed to create repository '$repo_name'." >&2
    return 1
  fi

    sleep 1

  # Disable additional features post-creation
  if ! gh repo edit "$repo_name" \
    --enable-projects=false \
    --enable-discussions=false; then
    echo "Warning: Failed to disable projects or discussions for '$repo_name'." >&2
    # Continue anyway, as the repo is created
  fi

  # Get the authenticated username for SSH clone URL
  local username
  username=$(gh api user --jq '.login')

  if [[ -z "$username" ]]; then
    echo "Error: Failed to retrieve GitHub username." >&2
    return 1
  fi

  # Clone with shallow fetch for efficiency
  if ! git clone --depth 1 --filter=blob:none "git@github.com:${username}/${repo_name}.git" "$clone_dir"; then
    echo "Error: Failed to clone repository." >&2
    return 1
  fi

  cd "$clone_dir"
  echo "Successfully created and cloned '$repo_name' into '$(pwd)'."
}
