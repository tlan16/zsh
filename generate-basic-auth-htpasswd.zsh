#!/usr/bin/env zsh

generate-basic-auth-htpasswd() {
    if ! command -v htpasswd >/dev/null 2>&1; then
        echo "Error: htpasswd command not found. Please install apache2-utils package." >&2
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
                echo "Usage: generate-basic-auth-htpasswd --username 'username' --password 'password'" >&2
                return 1
                ;;
        esac
    done
    
    if [[ -z "$username" || -z "$password" ]]; then
        echo "Error: Both --username and --password are required" >&2
        echo "Usage: generate-basic-auth-htpasswd --username 'username' --password 'password'" >&2
        return 1
    fi
    
    htpasswd -nb "$username" "$password"
}
