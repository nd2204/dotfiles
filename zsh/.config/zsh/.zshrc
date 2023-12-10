# zmodload zsh/zprof
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc. 
# Initialization code that may require console input (password prompts, [y/n] confirmations, etc.) must go above this block; everything else may go below. 
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#     source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# Load tmux on shell startup 
# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then exec tmux clear 
# fi 

# Custom Env --------------------------------------------------------------
export PATH="$HOME/bin:/usr/local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin"
export THEME="gruvbox"
export EDITOR="nvim"
export MUX="tmux"
export BROWSER=wslview
export ZSH="$HOME/.oh-my-zsh"
export ZDOTDIR="$HOME/.config/zsh"
export DOTFILES="$HOME/dotfiles"
export PATH="$PATH:$DOTFILES/bin"
export BAT_THEME="ansi"
export BAT_STYLE="auto"
export DISPLAY=:0
# End Custom Env ----------------------------------------------------------

# Theme ----------------------------------------------------------------
ZSH_THEME="haru"
PROMPT_EOL_MARK=
# source ~/powerlevel10k/powerlevel10k.zsh-theme
DISABLE_LS_COLORS="true"
ENABLE_CORRECTION="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="dd-mm-yyyy"
export VIRTUAL_ENV_DISABLE_PROMPT=0
# End Theme ------------------------------------------------------------


# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

plugins=(
    fzf
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-completions
    web-search
    virtualenv
    colored-man-pages
)

source $ZSH/oh-my-zsh.sh

# Lazyloading -------------------------------------------------------------
nvm() {
    NVM_DIR="$HOME/.nvm"
    if [[ -d $NVM_DIR ]]; then
        export NVM_DIR
        # shellcheck disable=SC1090
        source "${NVM_DIR}/nvm.sh"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
        [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
        if [[ -e "$HOME/.nvm/alias/default" ]]; then
            PATH="${PATH}:${HOME}.nvm/versions/node/$(cat ~/.nvm/alias/default)/bin"
        fi
        # invoke the real nvm function now
        nvm "$@"
    else
        echo "nvm is not installed" >&2
        return 1
    fi
}
# End Lazyloading ---------------------------------------------------------

# Aliases -----------------------------------------------------------------
# You may need to manually set your language environment
# export LANG=en_US.UTF-8
# Compilation flags
# export ARCHFLAGS="-arch x86_64"
alias wgcc=x86_64-w64-mingw32-gcc #compiling c program for 64bit window
alias bat="batcat --style auto"
alias nv=nvim
alias vi=nvim
alias mux=zellij
alias lg='lazygit'
alias l='exa --icons --sort type'
alias ls='exa --icons --sort type'
alias la='exa --icons -la --sort type'
alias las='exa --icons -la --git --sort type'
alias lss='exa --icons --git --sort type'
alias tree='exa --icons --tree -L 2 --sort type'
alias rshift="pkill -USR1 '^redshift$'"
alias python='python3'
alias py='python3'
# Tmux
alias ta='tmux attach'
alias td='tmux detach'
alias t='tmux'
alias trs='tmux rename-session'
alias trw='tmux rename-window'
alias bs='browser-sync' # more detail on https://browsersync.io/docs/command-line
# End Aliases -------------------------------------------------------------

# Custom function ---------------------------------------------------------
function run_multplexer() {
    case $1 in
        tmux)
            if [[ -z "$TMUX" && -z "$ZELLIJ" ]]; then
                tmux
                return 0
            fi
            ;;
        zellij)
            if [[ -z "$ZELLIJ" && -z "$TMUX" ]]; then
                zellij
                return 0
            fi
            ;;
        *)
            return 1
            ;;
    esac
}

# directory jumper
function jd() {
    local dir
    dir=$(cd "$HOME" && find ${1:-.} -type d -print 2> /dev/null | fzf +m --preview 'tree -C {} | head -200')
    abs_dir=$(cd "$HOME" && realpath ${dir#./} 2> /dev/null)
    if [ -d "$abs_dir" ]; then
        cd "$abs_dir"
        run_multplexer $MUX
    fi
}

function ffd() {
    local dir
    dir=$(find ${1:-.} -type d -print 2> /dev/null | fzf +m --preview 'tree -C {} | head -200') && cd "$dir"
    run_multplexer $MUX
}

function fe() {
    local file
    file=$(fzf --preview 'tree -C {} | head -200') && nvim "$file"
}
# End Custom Function -----------------------------------------------------

# Autorun -----------------------------------------------------------------
source $HOME/.config/fzf/config.sh
source $(dirname $(gem which colorls))/tab_complete.sh
# End Autorun -------------------------------------------------------------
