# vi: ft=bash

# 021011 zsh theme v2.0.0 - https://github.com/guesswhozzz/021011.zsh-theme

autoload -Uz compinit; compinit

# LOCAL/VARIABLES/ANSI =========================================================

local ANSI_reset="\x1B[0m"
local ANSI_dim_black="\x1B[38;05;8m"

# # LOCAL/VARIABLES/GRAPHIC ======================================================

# local char_prompt="$"                                            #Unicode: \u039b
# local char_arrow="›"                                            #Unicode: \u039b
# local char_up_and_right_divider="└"                             #Unicode: \u2514
# local char_down_and_right_divider="┌"                           #Unicode: \u250c
local char_vertical_divider="─"                                 #Unicode: \u2500

# # SEGMENT/VCS_STATUS_LINE ======================================================

# export VCS="git"

# local current_vcs="\":vcs_info:*\" enable $VCS"
# local char_badge="%F{green}git:%f"
# local vc_branch_name="%F{green}(%b)%f"

# local vc_action="%F{240}%a %f%F{240}${char_arrow}%f"
# local vc_unstaged_status="%F{red} M ${char_arrow}%f"

# local vc_git_staged_status="%F{108} A ${char_arrow}%f"
# local vc_git_hash="%F{151}%6.6i%f %F{240}${char_arrow}%f"
# local vc_git_untracked_status="%F{red} U ${char_arrow}%f"


# if [[ $VCS != "" ]]; then
#     autoload -Uz vcs_info
#     eval zstyle $current_vcs
#     zstyle ':vcs_info:*' get-revision true
#     zstyle ':vcs_info:*' check-for-changes true
# fi

# case "$VCS" in 
#     "git")
#         # git sepecific 
#         zstyle ':vcs_info:git*+set-message:*' hooks use_git_untracked
#         zstyle ':vcs_info:git:*' stagedstr $vc_git_staged_status
#         zstyle ':vcs_info:git:*' unstagedstr $vc_unstaged_status
#         zstyle ':vcs_info:git:*' actionformats "  ${vc_action} ${vc_git_hash}%m%u%c ${char_badge}${vc_branch_name}"
#         zstyle ':vcs_info:git:*' formats " %c%u%m ${char_badge}${vc_branch_name}"
#         ;;

#   # svn sepecific 
#   "svn")
#   zstyle ':vcs_info:svn:*' branchformat "%b"
#   zstyle ':vcs_info:svn:*' formats " ${char_badge} ${vc_branch_name}"
#   ;;

#   # hg sepecific 
#   "hg")
#   # zstyle ':vcs_info:hg:*' branchformat "%b"
#   zstyle ':vcs_info:hg:*' formats " ${char_badge} ${vc_branch_name}"
#   ;;
# esac

# # Show untracked file status char on git status line
# +vi-use_git_untracked() {
# if [[ $(git rev-parse --is-inside-work-tree 2>/dev/null) == "true" ]] &&
#     git status --porcelain | grep -m 1 "^??" &>/dev/null; then
#     hook_com[misc]=$vc_git_untracked_status
# else
#     hook_com[misc]=""
# fi
# }

# # SEGMENT/SSH_STATUS ===========================================================

# local ssh_marker=""

# if [[ -n "$SSH_CLIENT" || -n "$SSH2_CLIENT" ]]; then
#     ssh_marker=" %F{115}SSH%f%F{240}:%f"
# fi

# # UTILS ========================================================================

# Define a function to get the Python virtual environment name
get_venv() {
  if [[ -n "$VIRTUAL_ENV" ]]; then
    echo "(${VIRTUAL_ENV##*/}) "  # Extract just the env name from the full path
  fi
}

# setopt PROMPT_SUBST

# # Prepare git status line
# prepareGitStatusLine() {
#     echo '${vcs_info_msg_0_}'
# } 

# Prepare prompt line limiter
printPsOneLimiter() {
    local termwidth
    local spacing=""

    ((termwidth = ${COLUMNS}))

    for i in {1..$termwidth}; do
        spacing="${spacing}${char_vertical_divider}"
    done

    echo $ANSI_dim_black$spacing$ANSI_reset
}

# username() {
#     echo "%f%F{blue}%n%f"
# }

# sep() {
#     # echo "%f%F{240}::%f"
#     echo " "
# }

# dir() {
#     echo "%f%F{green}%1~%f"
# }

# time_stat() {
#     echo "%f%F{white}[%*]%f"
# }

# # ENV/VARIABLES/PROMPT_LINES ===================================================

# PROMPT="$(time_stat)${ssh_marker}$(sep)$(username):$(dir)$(sep)%F{white}${char_prompt}%f "
PROMPT='[%*] $(get_venv)%{$fg[cyan]%}%n%{$reset_color%}:%{$fg[green]%}%c%{$reset_color%}$(git_prompt_info) %(!.#.$) '

# RPROMPT="$(prepareGitStatusLine)"

# # ENV/HOOKS ==================================================================== 

precmd() {
  # if [[ $VCS != "" ]]; then
  #   vcs_info
    # printPsOneLimiter
  # fi
}

# # ENV/VARIABLES/LS_COLORS ======================================================

# LSCOLORS=gxafexDxfxegedabagacad
# export LSCOLORS

# LS_COLORS=$LS_COLORS:"di=36":"ln=30;45":"so=34:pi=1;33":"ex=35":"bd=34;46":"cd=34;43":"su=30;41":"sg=30;46":"ow=30;43":"tw=30;42":"*.js=01;33":"*.json=33":"*.jsx=38;5;117":"*.ts=38;5;75":"*.css=38;5;27":"*.scss=38;5;169"
# export LS_COLORS

# # SEGMENT/COMPLETION ===========================================================

# setopt MENU_COMPLETE

# local completion_descriptions="%B%F{85} ${char_prompt} %f%%F{green}%d%b%f"
# local completion_warnings="%F{yellow} ${char_prompt} %fno matches for %F{green}%d%f"
# local completion_error="%B%F{red} ${char_prompt} %f%e %d error"

# zstyle ':completion:*' completer _expand _complete _ignored _approximate
# zstyle ':completion:*' use-cache on
# zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"
# zstyle ':completion:*' verbose yes
# zstyle ':completion:*' menu select
# zstyle ':completion:*' matcher-list "m:{a-z}={A-Z}"
# zstyle ':completion:*' group-name ''

# zstyle ':completion:*:*:*:*:descriptions' format $completion_descriptions
# zstyle ':completion:*:*:*:*:corrections' format $completion_error
# zstyle ':completion:*:*:*:*:default' list-colors ${(s.:.)LS_COLORS} "ma=38;5;253;48;5;23"
# zstyle ':completion:*:*:*:*:warnings' format $completion_warnings
# zstyle ':completion:*:*:*:*:messages' format "%d"

# zstyle ':completion:*:expand:*' tag-order all-expansions
# zstyle ':completion:*:approximate:*' max-errors "reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )"
# zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
# zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns "*?.o" "*?.c~" "*?.old" "*?.pro"
#                                  zstyle ':completion:*:functions' ignored-patterns "_*"

#                                  zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

# # ==============================================================================

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[yellow]%}git:("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
