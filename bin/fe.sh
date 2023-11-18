#!/bin/bash

fe () {
    file=$(fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}')
    if [ -n "$file" ]; then
        if command -v tmux > /dev/null 2>&1 && [ $MUX == "tmux" ]; then
            if [ -z "$TMUX" ]; then
                tmux new-session -d -s edit;
                tmux send-keys -t edit "$EDITOR \"$file\"" C-m
                tmux attach-session -t edit
            else
                $EDITOR "$file"
            fi
        elif command -v zellij > /dev/null 2>&1 && [ $MUX == "zellij" ]; then
            if [ -z "$ZELLIJ" ]; then
                zellij
            else
                $EDITOR "$file"
            fi
        else
            $EDITOR "$file"
        fi
    else
        exit 1
    fi
}
