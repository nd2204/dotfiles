#!/bin/bash

if [ -f /etc/os-release ]; then
    # Use the /etc/os-release file to get the distribution name
    . /etc/os-release
    distro="$NAME"
elif [ -f /etc/lsb-release ]; then
    # Use the /etc/lsb-release file to get the distribution name
    . /etc/lsb-release
    distro="DISTRIB_ID"
elif [ -f /etc/debian_version ]; then
    # We're on Debian
    distro="Debian"
elif [ -f /etc/redhat-release ]; then
    # We're on Red Hat or CentOS
    distro="Red Hat/CentOS"
else
    distro="Unknown"
fi

echo "Detected $distro"
echo "This script will install the following pakage:"
echo "
zsh - better console shell with various feature
tmux - terminal multiplexer
Lazygit - Git Modern Interface
man - pakage manual
fd - Find files, directory
fzf - Find files, dir interface
cloc - Count line of code
stow - dotfiles manager
"
read -p "Do you want to proceed? (y/n) " answer
if [[ "$answer" =~ ^[Yy]$ ]]; then
    # Network
    sudo pacman -S --noconfirm inetutils net-tools coreutils
    # awesome prerequisites
    sudo pacman -S --noconfirm man zsh feh rofi picom imagemagick light xclip maim dunst thunar firefox ncdu pavucontrol pamixer playerctl
    sudo pacman -S --noconfirm ttf-nerd-fonts-symbols-common
    sudo pacman -S --noconfirm ranger lazygit fd fzf cloc stow tmux neofetch
    # Add your Arch-specific setup code here
else
    echo "Aborting."
    exit 1
fi
