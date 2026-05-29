.PHONY: stow
stow:
	echo "Stowing dotfiles to ~"
	stow .

.PHONY: destow
destow:
	echo "Destowing dotfiles from ~"
	stow -D .

.PHONY: install_packages
install_packages:
	brew install git curl wget tree fzf htop btop tmux stow zsh sqlite neovim nmap python3 lolcat sl asciiquarium

.PHONY: install_apps
install_apps:
	brew install --cask signal
	brew install --cask linearmouse

.PHONY: install_tmux_tpm
install_tmux_tpm:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
