#!/usr/bin/env zsh

alias rea-docker-login="rea-as okta eventus-dev-ReadWrite aws ecr get-login-password | docker login --username AWS --password-stdin 639347700193.dkr.ecr.ap-southeast-2.amazonaws.com"
