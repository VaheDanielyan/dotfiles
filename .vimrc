" __   _(_)_ __ ___  _ __ ___ 
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__ 
"   \_/ |_|_| |_| |_|_|  \___|
"                             
"
"    Vahe Danielyan 2021
"
" for neovim
" 1 " mkdir -p ~/.local/share/nvim
" 2 " ln -s ~/.vim ~/.local/share/nvim/site 
" 3 " ln -s ~/.vimrc .config/nvim/init.vim



set tabstop=2 softtabstop=2
set exrc
set relativenumber
set nu
set noerrorbells
set noswapfile
set incsearch
set wildmenu
set cmdheight=2

"plugin manager
set encoding=UTF-8
let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.vim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif
if vim_plug_just_installed " manually load vim-plug the first time
    :execute 'source '.fnameescape(vim_plug_path)
endif
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/goyo.vim'
Plug 'coldfix/hexHighlight'
Plug 'scrooloose/nerdtree'
Plug 'dense-analysis/ale'
Plug 'rking/ag.vim'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'ryanoasis/vim-devicons'
Plug 'gruvbox-community/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'gosukiwi/vim-atom-dark'
Plug 'vhdirk/vim-cmake'
Plug 'bfrg/vim-cpp-modern'
call plug#end()

"Mapping alt to Toggle NERD
map <Tab> :NERDTreeToggle<CR>
color onedark 
