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
	sudo dnf install git net-tools cmake neovim gcc curl tree \
					 gimp gnome-extensions-app gnome-tweaks clang-tools-extra \
					 asio-devel python3 python3-pip libreoffice-writer libreoffice-calc sassc eigen3-devel fzf \
					 openssh-server mosh fastfetch htop nmap ninja-build cargo libtool \
					 picocom systemd-resolved socat sl sqlite stlink vim wget gnome-browser-connector \
					 pkgconf-pkg-config freetype-devel fontconfig-devel libxcb-devel libxkbcommon-devel tmux \
					 mesa-libGL-devel freeglut-devel SDL2 SDL2-devel bear gflags-devel xclip \
					 powerline-fonts btop fuse-libs stow nodejs zsh rustup brave-browser \
					 cmake golang ninja-build meson clang-devel clangd ruby-devel stlink hashcat \
					 john nmap wireshark socat picocom htop btop fira-code-fonts powerline-fonts dconf-editor cascadia-code-nf-fonts.noarch \
					 argon2 brave-browser cascadia-code-nf-fonts.noarch cppunit-devel curlpp-devel fmt-devel glog-devel gnome-themes-extra grpc-devel \
					 gtk-murrine-engine iotop jsoncpp-devel jsoncpp-doc libargon2-devel msgpack-devel opencv-devel ostree libappstream-glib \
					 python3-devel readline-devel signal-desktop tailscale ulauncher yaml-cpp-devel @development-tools @c-development @multimedia
	# pip
	echo "INSTALLING PIP PACKAGES"
	pip install pyserial
	pip install pyqt5
	pip install python-language-server
	pip install cmake-language-server
	sudo npm i -g bash-language-server

.PHONY: install_tmux_tpm
install_tmux_tpm:
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

.PHONY: install_udev
install_udev:
	@echo "Installing udev rules, please enter sudo password"
	sudo cp -r ./udev/rules.d /etc/udev/
	
.PHONY : install_visual
install_visual:
	git submodule init && git submodule update
	./external/Tela-icon-theme/install.sh

.PHONY : install_apps
install_apps:
	flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/
	flatpak install flathub org.signal.Signal
	flatpak install flathub md.obsidian.Obsidian
	flatpak install flathub org.mavlink.qgroundcontrol
	flatpak install flathub com.obsproject.Studio
	flatpak install flathub org.onlyoffice.desktopeditors
	flatpak install flathub com.bitwarden.desktop
	sudo dnf config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
	sudo dnf install brave-browser

.PHONY : install_arm_embedded_gcc
	curl https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2
	tar -xvf gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2
