#!/usr/bin/env bash
set -euo pipefail

raycast_dir="$HOME/Library/Application Support/com.raycast.macos"
temp_dir=""
git_repo="git@github.com:tlan16/raycast-backup.git"

if [ -d "$raycast_dir" ]; then
  temp_dir=$(mktemp -d -t raycast_backup-XXXX)
  git clone --depth 1 --filter=blob:none "$git_repo" "$temp_dir"
  rm -vrf "${temp_dir}/archive.7z"
  zpaqfranz a "${temp_dir}/archive.7z" "${raycast_dir}"
  du -h "${temp_dir}"
  "${temp_dir}/scripts/git-adder.sh"
  rm -vrf "$temp_dir"
else
  echo "Raycast directory ${raycast_dir} does not exist"
fi
