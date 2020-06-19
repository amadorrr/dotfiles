"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: 
"       Amador — @amadxr
"
" Sections:
"    -> Default settings to keep my sanity
"    -> Plugins config
"    -> Mappings
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Default settings to keep my sanity
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable 
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set cursorline
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
set autoread
let mapleader = " "
set title
set showmatch 
set ffs=unix,dos,mac
set nostartofline
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
set splitright
set splitbelow
set hlsearch
set foldcolumn=1
set encoding=utf8

fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

autocmd BufWritePre *.js,*.py,*.ts,*.php :call CleanExtraSpaces()
autocmd BufNewFile,BufRead *.blade.php set syntax=html
autocmd BufNewFile,BufRead *.blade.php set filetype=html

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin("~/.config/nvim/plugged")
    Plug 'morhetz/gruvbox'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'jremmen/vim-ripgrep'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-commentary'
    Plug 'vim-utils/vim-man'
	Plug 'scrooloose/nerdtree'
    Plug 'mbbill/undotree'
    Plug 'neomake/neomake'
    Plug 'StanAngeloff/php.vim'
    Plug 'stephpy/vim-php-cs-fixer'
	Plug 'ryanoasis/vim-devicons'
    Plug 'git@github.com:Valloric/YouCompleteMe.git'
call plug#end()

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let php_var_selector_is_identifier = 1

call neomake#configure#automake('nrwi')

colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic = 1

if executable('rg')
    let g:rg_derive_root='true'
endif

autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
map 0 ^
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>ps :Rg<SPACE>
nnoremap <silent> <leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>gf :YcmCompleter FixIt<CR>
nnoremap <C-p> :FZF<CR>
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
nnoremap <leader>; :nohlsearch<CR>
