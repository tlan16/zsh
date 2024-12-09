#!/usr/bin/env zsh

alias rea-docker-login="rea-as okta eventus-dev-ReadWrite aws ecr get-login-password | docker login --username AWS --password-stdin 639347700193.dkr.ecr.ap-southeast-2.amazonaws.com"

function rea-match-db-tunnel {
  rea-as okta property-data-prod-ReadWrite -- \
    /Volumes/Documents/fargate-bastion/fargate-bastion \
    subnet-29ddaa5e subnet-17ddaa60 \
    --tunnel "25432:db.property-matches.property-data.realestate.com.au:5432"
}
