set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'chriskempson/base16-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'Valloric/YouCompleteMe'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'fatih/vim-go'
Bundle 'yonchu/accelerated-smooth-scroll'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Put your non-Plugin stuff after this line

" Colors
let base16colorspace=256 " Access colors present in 256 colorspace
set t_Co=256
colorscheme base16-bright	" awesome colorscheme
syntax enable			" enable syntax processing
set background=dark

" White Space
set tabstop=4			" number of visual spaces per TAB
set softtabstop=4		" number of spaces in tab when editing
set autoindent
set smarttab			"use tabs at the start of the line, spaces elsewhere
set nowrap				"Don't wrap lines
set linebreak			"Wrap lines at convenient places

" Swap files
set noswapfile
set nobackup
set nowb

" UI
set laststatus=2
set number              " show line numbers
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]
set ruler				" Aways show info along the bottom
set showmode			" display my current mode down at the bottom
set guifont=Source\ Code\ Pro:h12
set notimeout                   " No command timeout
set showcmd                     " Show typed command prefixes while waiting for operator
set scrolloff=3                 " Scroll when the cursor is 3 lines from edge
set autoread                    " No prompt for file changes outside Vim

" Mouse
set mouse=a
set ttymouse=xterm2
 
" Search
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set hls                 " search with highlights by default

" Folding
set foldenable          " enable folding

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1

" Airline
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#displayed_head_limit = 10
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#enabled = 1

" unicode symbols
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'

" NERD Trea
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeSortHiddenFirst = 1
let NERDTreeChDirMode = 1
let NERDTreeHighlightCursorline = 1
let NERDTreeMouseMode = 2
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1

" Fugitive
" " Automatically delete Fugitive buffers that are no longer being used.
" " Otherwise, they tend to fill up the buffer list.
" "
" " Credit to Drew Neil of Vimcasts:
" "
" http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/

autocmd BufReadPost fugitive://* set bufhidden=delete

" Unset 'list' in :Gstatus window (which usually contains tab characters).
autocmd BufReadPost .git/index set nolist

" tmux
if &term == "screen-256color"
	let &t_SI = "\<Esc>[3 q"
	let &t_EI = "\<Esc>[0 q"
endif
