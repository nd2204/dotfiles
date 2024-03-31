#!/usr/bin/bash

if [ "$#" -lt 1 ]; then
		echo "Invalid usage"
		exit 1
fi

if [[ ! -d $DOTFILES || -z $DOTFILES ]]; then
		echo "ERROR: DOTFILES environment variable not set! Searching for the dotfiles in current user home directory..."
		dotfiles_path=n(find ~ -type d -name 'dotfiles')
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

function install_omz() {
		if [[ ! -z $ZSH ]]; then
				sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
				git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
				git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
				git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
				git clone https://github.com/jeffreytse/zsh-vi-mode ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-vi-mode
		fi
}

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
						chmod u+x $DOTFILES/bin/setup/setup.sh
						$DOTFILES/bin/setup/setup.sh
						;;
				*)
						echo "Unsuported Distro aborting"
						;;
		esac
}

[[ p10k =~ $@ && ! -z $ZSH ]] && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k;
[[ omz =~ $@  && ! -z $ZSH ]] && install_omz
[[ distro =~ $@ ]]            && distro_setup


[[ ! -d ~/Desktop ]] && mkdir ~/Desktop
[[ ! -d ~/Downloads ]] && mkdir ~/Downloads
[[ ! -d ~/Documents ]] && mkdir ~/Documents
