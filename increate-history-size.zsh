#!/usr/bin/env zsh

## Upstream: https://github.com/bamos/zsh-history-analysis/tree/master?tab=readme-ov-file#increasing-the-history-file-size

export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY
