# macOS dotfiles

Zsh, Alacritty, tmux, and Neovim configuration managed with GNU Stow.

## Setup

Install Homebrew first, then run from this directory:

```sh
make install_packages
make check_stow
make stow
make install_tmux_tpm
```

`make check_stow` previews links without changing files. Resolve any reported
conflicts before running `make stow`. `make destow` removes managed links.

Install Alacritty and ComicCode Nerd Font Mono separately. `make install_apps`
installs the optional Signal and LinearMouse apps.

In Neovim, run `:PackerSync` to install plugins, then restart Neovim. The generated
Packer loader lives in Neovim's data directory under `site/plugin/`, so it is
regenerated for each machine. Language servers in `coc-settings.json` need their
own installations. In tmux, press the backtick prefix followed by `I` to install
plugins.

## Local data

On the current Mac, `~/.config`, `~/.local`, and `~/workspace` are directory
symlinks into this repository. Application state, downloaded plugins, and
personal workspace contents are ignored by Git; existing files stay in place.
Stow exclusions prevent selected local data from being linked on a fresh setup,
but do not filter writes through existing directory symlinks.

New application configuration files still appear in `git status`, so useful
settings can be selected deliberately. Review changes before staging them.

Zsh loads shared environment settings from `.config/envrc` and aliases from
`.config/aliasrc`. The terminal supplies `TERM`; tmux sets its own terminal type.
