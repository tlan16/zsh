#!/usr/bin/env zsh

function start-matchmaker-api {
    local current_dir
    current_dir=$(pwd)
    current_dir=$(basename "$current_dir")
    if [ "$current_dir" = "matchmaker-api" ]; then
        rea-as okta ptau-staging-ReadWrite auto/dev-environment sbt run
    else
        echo "Not in matchmaker-api directory"
    fi
}
