#!/usr/bin/env zsh
# Upstream: https://github.com/bamos/zsh-history-analysis/tree/master?tab=readme-ov-file#increasing-the-history-file-size

export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
  
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP
