" required
set nocompatible

" encoding
set encoding=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936

" history
set history=1000

" display
syntax on
set number
set relativenumber
set wrap
set ruler
set cursorline

" search
set hlsearch
set incsearch
set showmatch

" indent
set autoindent
set smartindent
set smarttab
set tabstop=4

" clipboard
set clipboard=unnamedplus

" automatic installation for vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" theme
Plug 'sonph/onehalf' , { 'rtp': 'vim' }
" file
Plug 'preservim/nerdtree'
" autocmd VimEnter * NERDTree | wincmd p
Plug 'kien/ctrlp.vim'
" syntax 
Plug 'tpope/vim-commentary'
Plug 'dense-analysis/ale'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

" sonph/onehalf
set t_Co=256
" set cursorline
colorscheme onehalfdark
