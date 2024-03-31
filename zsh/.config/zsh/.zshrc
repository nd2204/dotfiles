# zmodload zsh/zprof
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc. 
# Initialization code that may require console input (password prompts, [y/n] confirmations, etc.) must go above this block; everything else may go below. 
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#     source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# Load tmux on shell startup 
# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then exec tmux clear 
# fi

# if command -v draconis &> /dev/null; then draconis
# fi

# Custom Env --------------------------------------------------------------
# TODO: Change PATH env to accept only  existing path
export PATH="$HOME/.cargo/bin:$HOME/.local/share/gem/ruby/3.0.0/bin:$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH"
export THEME="gruvbox"
export MUX="tmux"
export BROWSER=wslview
export ZSH="$HOME/.oh-my-zsh"
export ZDOTDIR="$HOME/.config/zsh"
export TMUXRC="$HOME/.tmux.conf"
export DOTFILES="$HOME/dotfiles"
export PATH="$PATH:$DOTFILES/bin"
export BAT_THEME="ansi"
export BAT_STYLE="auto"
export DISPLAY=:0
if [[ ! -z $(command -v nvim) ]]; then
	export EDITOR="nvim";
elif [[ ! -z $(comman -v vim) ]]; then
	export EDITOR="vim";
else
	export EDITOR="nano"
fi
# End Custom Env ----------------------------------------------------------

# Theme ----------------------------------------------------------------
ZSH_THEME="haru"
# ZSH_THEME="geoffgarside"
PROMPT_EOL_MARK=
# source ~/powerlevel10k/powerlevel10k.zsh-theme
DISABLE_LS_COLORS="true"
ENABLE_CORRECTION="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="dd-mm-yyyy"
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

[[ ! -z $ZSH ]] . $ZSH/oh-my-zsh.sh || echo "omz not found"

# Loading aliases
[[ -f $HOME/.config/.zsh_aliases ]] . $HOME/.config/zsh/.zsh_aliases

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
    abs_dir=$(find $HOME -type d -name ".*" -prune -o -type d -print | fzf +m)
    # abs_dir=$(cd "$HOME" && realpath ${dir#./} 2> /dev/null)
    if [ -d "$abs_dir" ]; then
        cd "$abs_dir"
        run_multplexer $MUX
    fi
}

function ffd() {
    local dir
    dir=$(find $(pwd) -type d -print 2> /dev/null | fzf +m) && cd "$dir"
    run_multplexer $MUX
}

function fe() {
    local file
    file=$(fzf --preview 'batcat --style auto {}') && $EDITOR "$file"
}
# End Custom Function -----------------------------------------------------

# Autorun -----------------------------------------------------------------
[[ -d  $DOTFILES ]] . $DOTFILES/.config/fzf/config.sh
# . $(dirname $(gem which colorls))/tab_complete.sh
#
# End Autorun -------------------------------------------------------------
