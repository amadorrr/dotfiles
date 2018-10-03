" Vimrc file by: JOAMADORRR

" GENERAL VIM CONFIGURATIONS

set nocompatible " required
syntax on

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Spaces and tabs related configurations
" (first two lines are just in case, don't really use tab characters)
set copyindent " copy previous indentation on autoindenting
set tabstop=4 " visual spaces per tab
set softtabstop=4 " visual spaces per tab when editing
set expandtab " transform tabs into spaces
set autoindent
set shiftwidth=4 " indent corresponds to a single tab
set smarttab " insert necessary indents
set backspace=indent,eol,start " make backspace behave in a sane manner
filetype plugin indent on

" Ease of use configurations
set number relativenumber " show line numbers
set laststatus=2
set showcmd " show commands in bottom bar
set ruler " show cursos position
set history=50 " 50 lines of command line history
set cursorline " highlight current line
set title
filetype on
filetype indent on " load filetype specific indentations
set wildmenu " visual autocomplete menu
set ttyfast " fast terminal connections
set showmatch " highlight matching brackets and so
set hidden
set nostartofline " don't reset cursor
set shortmess=atI " don't show intro message when starting vim
set showmode " show current mode

" Search related configurations
set incsearch
set hlsearch " incsearch and hlsearch help easy searching through files
set ignorecase

" Key mappings
let mapleader="," " leader is now , and not \
nnoremap <leader><space> :nohlsearch<CR> " turn off hl after search with ,space

inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop> 
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop> " key mappings to disable arrow keys

" Configurations per file type
au FileType javascript setl sw=2 sts=2
au FileType json setl sw=2 sts=2
au FileType javascript.jsx setl sw=2 sts=2
au FileType css setl sw=2 sts=2
au FileType scss setl sw=2 sts=2 " sets shiftwidth and tabstops to 2 spaces for javascript and css files

" PLUGIN SPECIFIC CONFIGURATIONS

" CtrlP Settings
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_show_hidden = 1

" Plug Settings: List of active plugins
call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'sheerun/vim-polyglot'
Plug 'chriskempson/base16-vim'
Plug 'elixir-lang/vim-elixir'

call plug#end()
