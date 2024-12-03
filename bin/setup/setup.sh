#!/bin/bash

DOTFILES=""
if [[ ! -d $DOTFILES || -z $DOTFILES ]]; then
	echo "ERROR: DOTFILES environment variable not set! Searching for the dotfiles in current user home directory..."
	DOTFILES=$(find ~ -type d -name "dotfiles" -maxdepth 1 -print | head -n 1)
	if [[ -z $DOTFILES ]]; then
		read -r -p "Where's the dotfiles: " DOTFILES
		if [ -d $dotfiles_path ]; then
			export DOTFILES=$(realpath ${DOTFILES})
		else
			echo "Error: $DOTFILES Not a directory"
			exit 1
		fi
	fi
	echo "Found dotfiles at: $DOTFILES"
fi

DOTFILES=${DOTFILES:-~/dotfiles}

if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$NAME
elif type lsb_release >/dev/null 2>&1; then
    # linuxbase.org
    OS=$(lsb_release -si)
elif [ -f /etc/lsb-release ]; then
    # For some versions of Debian/Ubuntu without lsb_release command
    . /etc/lsb-release
    OS=$DISTRIB_ID
elif [[ "$(uname)" == "Darwin" ]]; then
    OS="macOS"
else
    OS="unknown"
fi

echo "$OS"

case $OS in
    Ubuntu)
        echo "Launching Ubuntu setup script"
        chmod u+x $DOTFILES/bin/setup/installer/distro-ubuntu.sh
        $DOTFILES/bin/setup/installer/distro-ubuntu.sh
        $DOTFILES/bin/setup/installer/install.sh omz nvm
        echo "Setup complete! Remember to stow the config files"
        ;;
    macOS)
        echo "Launching MacOS setup script"
        chmod u+x $DOTFILES/bin/setup/installer/distro-macos.sh
        $DOTFILES/bin/setup/installer/distro-macos.sh
        $DOTFILES/bin/setup/installer/install.sh omz nvm
        echo "Setup complete! Remember to stow the config files"
        ;;
    *)
        echo "Unsuported Distro aborting"
        ;;
esac

[[ ! -d ~/.config ]] && mkdir ~/.config
[[ ! -d ~/Desktop ]] && mkdir ~/Desktop
[[ ! -d ~/Downloads ]] && mkdir ~/Downloads
[[ ! -d ~/Documents ]] && mkdir ~/Documents
