# zmodload zsh/zprof

# Custom Env --------------------------------------------------------------
[[ ! -z $(command -v cargo) ]] && export PATH="$PATH:$HOME/.cargo/bin" 
[[ ! -z $(command -v gem) ]] && export PATH="$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin" 
[[ -d $HOME/.oh-my-zsh ]] && export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH"
export THEME="gruvbox"
export MUX="tmux"
export BROWSER=wslview
export TMUXRC="$HOME/.tmux.conf"
export DOTFILES="$HOME/dotfiles"
export PATH="$PATH:$DOTFILES/bin"
export BAT_THEME="ansi"
export BAT_STYLE="auto"
if [[ ! -z $(command -v nvim) ]]; then
	export EDITOR="nvim";
elif [[ ! -z $(comman -v vim) ]]; then
	export EDITOR="vim";
else
	export EDITOR="nano"
fi
[[ -z $DISPLAY ]] && export DISPLAY=:0 || export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0
export LIBGL_ALWAYS_INDIRECT=0
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

[[ ! -z $ZSH ]] && . $ZSH/oh-my-zsh.sh || echo "omz not found. Installing"

# Loading aliases
[[ -f $HOME/.config/zsh/.zsh_aliases ]] && . $HOME/.config/zsh/.zsh_aliases

# Lazyloading -------------------------------------------------------------
nvm() {
    NVM_DIR="$HOME/.nvm"
    if [[ -d $NVM_DIR ]]; then
        export NVM_DIR
        # shellcheck disable=SC1090
        source "${NVM_DIR}/nvm.sh"
        [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
        [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
        if [[ -e "$HOME/.nvm/alias/default" ]]; then
            PATH="${PATH}:${HOME}.nvm/versions/node/$(cat ~/.nvm/alias/default)/bin"
        fi
        # invoke the real nvm function now
	[ $# -lt 2 ] && nvm "$@"
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
[[ -f "~/.fzf.zsh" ]] && source ~/.fzf.zsh
source ${DOTFILES:-~/dotfiles}/config/fzf_config.sh
# . $(dirname $(gem which colorls))/tab_complete.sh
# End Autorun -------------------------------------------------------------
