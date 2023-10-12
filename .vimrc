" Vahe Danielyan 2021

" for neovim
" 1 " mkdir -p ~/.local/share/nvim
" 2 " ln -s ~/.vim ~/.local/share/nvim/site 
" 3 " ln -s ~/.vimrc .config/nvim/init.vim
"
set tabstop=4 softtabstop=4
set encoding=UTF-8
set shiftwidth=4
set expandtab
set exrc
set relativenumber
set nu
set noerrorbells
set noswapfile
set incsearch
set wildmenu
set cmdheight=1
set updatetime=300

let mapleader = " "

"plugin manager
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
Plug 'coldfix/hexHighlight'
Plug 'ryanoasis/vim-devicons'


call plug#end()

" VIM Multiple Cursors Mapping - Default
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'


