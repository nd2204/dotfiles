# zmodload zsh/zprof

# MacOS specific config
if [[ "$(uname)" == "Darwin" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  export BROWSER=open
  export PATH="$PATH:/Applications/Xcode.app/Contents/Developer/usr/bin"
  export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"
  export PATH="/opt/homebrew/opt/gnu-getopt/bin:$PATH"
  export PATH="$PATH:$HOME/.dotnet/tools"
  export PATH="/usr/local/sbin:$PATH"
else
  export BROWSER=wslview
fi

# Custom Env --------------------------------------------------------------
[[ -d $HOME/.cargo/bin ]] && export PATH="$PATH:$HOME/.cargo/bin" 
[[ ! -z $(command -v gem) ]] && export PATH="$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin" 
[[ -d $HOME/.oh-my-zsh ]] && export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH"
export THEME="gruvbox"
export MUX="tmux"
export TMUXRC="$HOME/.tmux.conf"
export DOTFILES="$HOME/dotfiles"
export PATH="$PATH:$DOTFILES/bin"
export BAT_THEME="ansi"
export BAT_STYLE="auto"
export THEME_MODE="dark"
# export TERM="xterm-kitty"
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
  if [ ! -z $NVM_DIR && -d $NVM_DIR ]; then
    load_nvm
    nvm "$@"
  else
    echo "nvm is not installed" >&2
    return 1
  fi
}

load_nvm() {
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  if [[ -e "$HOME/.nvm/alias/default" ]]; then
    PATH="${PATH}:${HOME}.nvm/versions/node/$(cat ~/.nvm/alias/default)/bin"
    export PATH
  fi
}

npm() {
  unset -f npm
  local NVM_DIR="$HOME/.nvm"
  if [[ -d $NVM_DIR ]]; then
    load_nvm
    command npm "$@"
  fi
}

npx() {
  unset -f npx
  local NVM_DIR="$HOME/.nvm"
  if [[ -d $NVM_DIR ]]; then
    load_nvm
    command npx "$@"
  fi
}

node() {
  unset -f node
  local NVM_DIR="$HOME/.nvm"
  if [[ -d $NVM_DIR ]]; then
    load_nvm
    command node "$@"
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
  abs_dir=$(find -x $HOME -maxdepth 5 -type d -name ".*" -not -name ".config" -not -name ".local" -prune -o -type d -print 2>/dev/null | fzf +m)
  # abs_dir=$(cd "$HOME" && realpath ${dir#./} 2> /dev/null)
  if [ -d "$abs_dir" ]; then
    cd "$abs_dir" || return 1
    run_multplexer $MUX
  fi
}

function ffd() {
  local dir
  dir=$(find $(pwd) -type d -print 2>/dev/null | fzf +m) && cd "$dir"
  run_multplexer $MUX
}

function fe() {
  local file
  file=$(fzf --preview 'bat --style auto {}') && $EDITOR "$file"
}

function repo() {
  if [ -z "$REPO_DIR" ]; then
    export REPO_DIR=$(find -x $HOME -maxdepth 5 -type d -name ".*" -not -name ".config" -not -name ".local" -prune -o -type d -name "repos" -print 2>/dev/null | head -n 1)
  fi

  if [ -d "$REPO_DIR" ]; then
    cd "$REPO_DIR" || return 1
    run_multplexer $MUX
  fi
}
# End Custom Function -----------------------------------------------------

# Autorun -----------------------------------------------------------------
[[ -f "~/.fzf.zsh" ]] && source ~/.fzf.zsh
source ${DOTFILES:-~/dotfiles}/config/fzf_config.sh
# . $(dirname $(gem which colorls))/tab_complete.sh
load_nvm
# End Autorun -------------------------------------------------------------
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/nd2204/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
