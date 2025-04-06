#!/usr/bin/env zsh

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
