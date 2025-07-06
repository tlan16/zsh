#!/usr/bin/env zsh

generate-basic-auth-header() {
    if ! command -v base64 >/dev/null 2>&1; then
        echo "Error: base64 command not found. Please install base64 or coreutils package." >&2
        return 1
    fi
    
    local username=""
    local password=""
    
    while [[ $# -gt 0 ]]; do
        case $1 in
            --username)
                username="$2"
                shift 2
                ;;
            --password)
                password="$2"
                shift 2
                ;;
            *)
                echo "Unknown option: $1" >&2
                echo "Usage: generate-basic-auth-header --username 'username' --password 'password'" >&2
                return 1
                ;;
        esac
    done
    
    if [[ -z "$username" || -z "$password" ]]; then
        echo "Error: Both --username and --password are required" >&2
        echo "Usage: generate-basic-auth-header --username 'username' --password 'password'" >&2
        return 1
    fi
    
    local credentials="${username}:${password}"
    local encoded_credentials=$(echo -n "$credentials" | base64)
    
    echo "Authorization: Basic $encoded_credentials"
}
