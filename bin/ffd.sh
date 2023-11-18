#!/usr/bin/bash

# Navigating directory
function ffd() {
    local dir
    dir=$(find ${1:-.} -type d -print 2> /dev/null | fzf +m --preview 'tree -C {} | head -200')

    if [ -d "$dir" ]; then
        if command -v tmux > /dev/null 2>&1 && [ $MUX == "tmux" ] && [ -z "$TMUX" ]; then
            cd "$dir" && tmux
        elif command -v zellij > /dev/null 2>&1 && [ $MUX == "zellij" ] && [ -z "$ZELLIJ" ]; then
            cd "$dir" && zellij
        else
            cd "$dir" || return
        fi
    else
        exit 1
    fi
}
