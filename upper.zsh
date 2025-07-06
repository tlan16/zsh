#!/usr/bin/env zsh

upper() {
    if ! command -v tr >/dev/null 2>&1; then
        echo "Error: 'tr' command not found. Please install it." >&2
        return 1
    fi
    
    if [ $# -eq 0 ]; then
        tr '[:lower:]' '[:upper:]'
    else
        echo "$*" | tr '[:lower:]' '[:upper:]'
    fi
}

