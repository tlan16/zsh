#!/usr/bin/env zsh

function debian-sec-path() {
    sudo apt-get install $(debsecan --suite bookworm --format packages --only-fixed)
}
