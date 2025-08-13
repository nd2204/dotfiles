export ZDOTDIR=~/.config/zsh
touch ~/.hushlogin

[[ -f $ZDOTDIR/.zshenv ]] && . $ZDOTDIR/.zshenv
# . "$HOME/.cargo/env"

export VCPKG_ROOT="$HOME/vcpkg"
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

eval "$(/opt/homebrew/bin/brew shellenv)"

##
# Your previous /Users/nd2204/.zprofile file was backed up as /Users/nd2204/.zprofile.macports-saved_2025-01-20_at_11:48:36
##

# MacPorts Installer addition on 2025-01-20_at_11:48:36: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.
