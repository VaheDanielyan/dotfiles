.PHONY: stow
stow:
	echo "Stowing dotfiles to ~"
	stow --target="$(HOME)" .

.PHONY: destow
destow:
	echo "Destowing dotfiles from ~"
	stow --target="$(HOME)" -D .

.PHONY: check_stow
check_stow:
	stow --simulate --verbose --target="$(HOME)" .

.PHONY: install_packages
install_packages:
	brew install git curl wget tree fzf htop btop tmux stow zsh zsh-syntax-highlighting sqlite neovim node ripgrep lf nmap python3 lolcat sl asciiquarium

.PHONY: install_apps
install_apps:
	brew install --cask signal
	brew install --cask linearmouse

.PHONY: install_tmux_tpm
install_tmux_tpm:
	test -d "$(HOME)/.tmux/plugins/tpm" || git clone https://github.com/tmux-plugins/tpm "$(HOME)/.tmux/plugins/tpm"
