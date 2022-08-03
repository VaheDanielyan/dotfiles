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
	sudo apt-get install git cmake neovim gcc curl tree \
				 gimp gnome-shell-extensions gnome-tweaks \
				 libasio-dev python3 python3-pip libreoffice sassc \
				 openssh-server mosh neofetch htop nmap ninja-build cargo \
				 picocom resolvconf socat sl sqlite stlink-tools vim wget chrome-gnome-shell \
				 pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev tmux \
				 mesa-common-dev libglu1-mesa-dev libsdl2-2.0 libsdl2-dev bear \

	# snap packages
	echo "INSTALLING SNAP PACKAGES"
	sudo snap install code --classic
	sudo snap install brave
	sudo snap install signal-desktop
	sudo snap install telegram-desktop
	sudo snap install discord
	sudo snap install notion-snap

	# pip
	echo "INSTALLING PIP PACKAGES"
	pip install pyserial
	pip install pyqt5
	pip install dronekit
	
.PHONY : install_alacritty
install_alacritty:
	echo "INSTALLING ALACRITTY"
	echo "INSTALLING RUST COMPILER"
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	cd ./external/alacritty && cargo build --release
	echo "CREATING DESKTOP ENTRY FOR ALACRITTY"
	sudo cp alacritty/target/release/alacritty /usr/local/bin # or anywhere else in $PATH
	sudo cp alacritty/extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
	sudo desktop-file-install alacritty/extra/linux/Alacritty.desktop
	sudo update-desktop-database

.PHONY : install_visual
install_visual:
	git submodule init && git submodule update
	./external/Tela-icon-theme/install.sh
	./external/Yaru-Colors/install.sh

.PHONY : install_arm_embedded_gcc
	curl https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2
	tar -xvf gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2

.PHONY : shell-extentions ## TODO, doesnt work yet
shell-extentions:
	# dynamics panel transparency
	echo "Dynamics panel transparency"
	git clone https://github.com/rockon999/dynamic-panel-transparency.git	
	mv dynamic-panel-transparency/dynamic-panel-transparency@rockon999.github.io  ~/.local/share/gnome-shell/extensions/
	#dash to dock
	echo "Dash to Dock"
	git clone https://github.com/micheleg/dash-to-dock.git
	cd dash-to-dock && make && make install
	echo "Unite"
	git clone https://github.com/hardpixel/unite-shell
	cd unite-shell && mv unite@hardpixel.eu ~/.local/share/gnome-shell/extensions/
	
.PHONY : all
all : stow install_packages install_alacritty install_visual
	echo "DONE"


