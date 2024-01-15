#!/bin/bash

# Fuzzy find files

export FZF_COMPLETION_TRIGGER='**'

# export FZF_DEFAULT_OPTS="
#   --height 80% --layout=reverse --border sharp
# 	--color=fg:#908caa,bg:-1,hl:#ebbcba
# 	--color=fg+:#e0def4,bg+:-1,hl+:#ebbcba
# 	--color=border:#403d52,header:#31748f,gutter:-1
# 	--color=spinner:#f6c177,info:#9ccfd8
# 	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"

export FZF_DEFAULT_OPTS="
--preview-window=border-sharp
--height 50% --layout=reverse --border horizontal
--info=right
--color=fg:black,fg+:white
--color=bg:-1,bg+:grey
--color=hl:green,hl+:green
--color=border:grey
--color=header:blue
--color=gutter:-1
--color=spinner:blue
--color=info:white
--color=pointer:cyan
--color=marker:red
--color=prompt:green
--no-scrollbar
"
export FZF_ALT_C_OPTS="
"
# --preview 'tree -C {}'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
