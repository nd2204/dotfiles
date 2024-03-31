#!/usr/bin/bash

if [ "$#" -lt 1 ]; then
	echo "Invalid usage"
	exit 1
fi

if [[ ! -d $DOTFILES || -z $DOTFILES ]]; then
	echo "ERROR: DOTFILES environment variable not set! Searching for the dotfiles in current user home directory..."
	dotfiles_path=$(find ~ -type d -name "dotfiles" -print | head -n 1)
	if [[ -z $dotfiles_path ]]; then
		read -r -p "Where's the dotfiles: " dotfiles_path
		if [ -d $dotfiles_path ]; then
			export DOTFILES=$(realpath $dotfiles_path)
		else
			echo "Error: $dotfiles_path Not a directory"
			exit 1
		fi
	fi
	export DOTFILES=$dotfiles_path
fi

function distro_setup() {
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
	fi

	echo "$OS"
	case $OS in
		Ubuntu)
			echo "Launching Ubuntu setup script"
			chmod u+x $DOTFILES/bin/setup/installer/distro-ubuntu.sh
			$DOTFILES/bin/setup/installer/distro-ubuntu.sh
			$DOTFILES/bin/setup/installer/install
			;;
		*)
			echo "Unsuported Distro aborting"
			;;
	esac
}

[[ p10k =~ $@ && ! -z $ZSH ]] && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k;
[[ distro =~ $@ ]]            && distro_setup


[[ ! -d ~/.config ]] && mkdir ~/.config
[[ ! -d ~/Desktop ]] && mkdir ~/Desktop
[[ ! -d ~/Downloads ]] && mkdir ~/Downloads
[[ ! -d ~/Documents ]] && mkdir ~/Documents
