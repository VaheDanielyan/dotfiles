# Makefile to setup my Ubuntu/Linux system

.PHONY : stow #Uses .stow-local-ignore for the ignore files
stow :
	echo "Stowing .vimrc, .bashrc, .tmux.conf, .config/alacritty to ~"
	stow .

.PHONY : destow
destow:
	echo "Destowing .vimrc, .bashrc, .tmux.conf, .config/alacritty from ~"
	stow -D .

.PHONY : install_packages
install_packages:
	git submodule update --init --recursive
	# apt packages
	echo "INSTALLING APT PACKAGES"
	sudo apt-get update && sudo apt-get upgrade
	sudo apt-get install git net-tools cmake neovim gcc curl tree \
				 gimp gnome-shell-extensions gnome-tweaks clangd-12 \
				 libasio-dev python3 python3-pip libreoffice sassc libeigen3-dev \
				 openssh-server mosh neofetch htop nmap ninja-build cargo libtool \
				 picocom resolvconf socat sl sqlite stlink-tools vim wget chrome-gnome-shell \
				 pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev tmux \
				 mesa-common-dev libglu1-mesa-dev libsdl2-2.0 libsdl2-dev bear libgflags2.2 libgflags-dev\
				 fonts-powerline btop libfuse2 \

	# pip
	echo "INSTALLING PIP PACKAGES"
	pip install python-language-server
	pip install cmake-language-server
	# TODO. add node install for npm i -g bash-language-server

.PHONY: install_udev
install_udev:
	@echo "Installing udev rules, please enter sudo password"
	sudo cp -r ./udev/rules.d /etc/udev/
	
.PHONY : all
all : stow install_packages
	echo "DONE"


