set nocompatible              " be iMproved, required

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
"Plug 'Valloric/vim-operator-highlight'
"Plug 'airblade/vim-gitgutter'
"Plug 'raimondi/delimitmate'
"Plug 'ryanoasis/vim-devicons'
Plug 'Quramy/tsuquyomi'
Plug 'Shougo/vimproc.vim'
Plug 'SirVer/ultisnips'
Plug 'Valloric/ListToggle'
Plug 'Valloric/MatchTagAlways'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ap/vim-css-color'
Plug 'bling/vim-airline'
Plug 'burnettk/vim-angular'
Plug 'dracula/vim'
Plug 'editorconfig/editorconfig-vim'
"Plug 'ervandew/eclim'
Plug 'fatih/vim-go'
Plug 'itchyny/vim-cursorword'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-emoji'
Plug 'kchmck/vim-coffee-script'
Plug 'leafgarland/typescript-vim'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-signify'
Plug 'powerline/fonts'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-tbone'
Plug 'vimwiki/vimwiki'
Plug 'wincent/terminus'
Plug 'yonchu/accelerated-smooth-scroll'
Plug 'vim-scripts/CursorLineCurrentWindow'

if !filereadable(expand('~/.at_work'))
  Plug 'Valloric/YouCompleteMe'
endif

if filereadable(expand('~/.vimrc.local'))
  source $HOME/.vimrc.local
endif

" All of your Plugs must be added before the following line
call plug#end()            " required
" Put your non-Plug stuff after this line

" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set encoding=utf8
"set ambiwidth=double
" Colors
set termguicolors
set t_Co=256
color dracula

" White Space
set autoindent
set linebreak			"Wrap lines at convenient places
set nowrap				"Don't wrap lines
set smarttab			"use tabs at the start of the line, spaces elsewhere
set softtabstop=2		" number of spaces in tab when editing
set tabstop=2			" number of visual spaces per TAB

" Swap files
set backupdir=~/.vim-tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/tmp,/var/tmp,/tmp
set swapfile                    " Keep swapfiles

" UI
filetype indent on      " load filetype-specific indent files
set autoread            " No prompt for file changes outside Vim
set cursorline          " highlight current line
"set cursorcolumn        " highlight current column
set guifont=Inconsolata\ Nerd\ Font\ Medium\ 13
set hidden
set laststatus=2
set notimeout           " No command timeout
set number              " show line numbers
set ruler               " Aways show info along the bottom
set scrolloff=3         " Scroll when the cursor is 3 lines from edge
set showcmd             " Show typed command prefixes while waiting for operator
set showmatch           " highlight matching [{()}]
set showmode            " display my current mode down at the bottom
set wildmenu            " visual autocomplete for command menu
set colorcolumn=80
"set guicursor
hi Cursor guifg=#f8f8f2 guibg=#646e96
hi iCursor guifg=#f8f8f2 guibg=#646e96

if has("persistent_undo")
  call system('mkdir $HOME/.vim/undodir')
  set undodir=$HOME/.vim/undodir/
  set undofile
endif

" Search
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set hls                 " search with highlights by default

" Folding
set foldenable          " enable folding

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1
"let g:syntastic_error_symbol = "☠"
"let g:syntastic_warning_symbol = "⚠"
"let g:syntastic_style_error_symbol = "☡"
"let g:syntastic_style_warning_symbol = "☹"

" Signify
let g:signify_realtime = 1
let g:signify_sign_show_count = 0
"let g:signify_sign_delete = '⚊'
let g:signify_sign_delete = '__'
let g:signify_sign_changedelete = g:signify_sign_delete

hi SignifySignAdd guibg=#50fa7b guifg=#50fa7b
hi SignifySignChange guibg=#ffb86c guifg=#ffb86c
hi SignifySignChangeDelete guibg=#ffb86c guifg=#ff5555
hi SignifySignDelete gui=bold term=bold cterm=bold guifg=#ff5555 guibg=#44475a

hi Error guibg=#ff5555 guifg=#f8f8f2
hi vimError guibg=#ff5555 guifg=#f8f8f2
hi vimWarn guibg=#ffb86c guifg=#44475a

hi LineNr guibg=#44475a
hi Pmenu ctermfg=15 ctermbg=61 cterm=NONE guifg=#f8f8f2 guibg=#646e96 gui=NONE
hi PmenuSel ctermfg=16 ctermbg=84 cterm=bold guifg=#282a36 guibg=#50fa7b gui=NONE

" Airline
let g:airline#extensions#branch#displayed_head_limit = 10
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tmuxline#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline_powerline_fonts = 1

" unicode symbols
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
"let g:airline_symbols.branch = ''
"let g:airline_symbols.paste = ''

" NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
"autocmd vimenter * NERDTree
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

let NERDTreeChDirMode = 1
let NERDTreeDirArrows=1
let NERDTreeHighlightCursorline = 1
let NERDTreeMinimalUI=1
let NERDTreeMouseMode = 2
let NERDTreeShowHidden=1
let NERDTreeSortHiddenFirst = 1
"let g:NERDTreeDirArrowExpandable = ''
"let g:NERDTreeDirArrowCollapsible = ''


" ==================== YouCompleteMe ====================
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_of_chars_for_completion = 1

" ==================== UltiSnips ====================

"function! g:UltiSnips_Complete()
"    call UltiSnips#ExpandSnippet()
"    if g:ulti_expand_res == 0
"        if pumvisible()
"            return "\<C-n>"                                                                                                                                                               
"        else
"            call UltiSnips#JumpForwards()
"            if g:ulti_jump_forwards_res == 0
"               return "\<TAB>"
"            endif
"        endif
"    endif
"    return ""
"endfunction

"function! g:UltiSnips_Reverse()                                                                                                                                                           
        "call UltiSnips#JumpBackwards()
        "if g:ulti_jump_backwards_res == 0
                "return "\<C-P>"
        "endif

        "return ""
"endfunction

"if !exists("g:UltiSnipsJumpForwardTrigger")
        "let g:UltiSnipsJumpForwardTrigger = "<tab>"
"endif

"if !exists("g:UltiSnipsJumpBackwardTrigger")
        "let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"endif

"au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
"au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"

"" this mapping Enter key to <C-y> to chose the current highlight item 
"" and close the selection list, same as other IDEs.
"" CONFLICT with some plugins like tpope/Endwise
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"" Better Completion
"set complete=.,w,b,u,t
"set completeopt=longest,menuone



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
	set t_ut=
endif

" VIM-GO
let g:go_fmt_command = "goimports"
let g:go_highlight_build_constraints = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1

if executable('go-langserver')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'go-langserver',
        \ 'cmd': {server_info->['go-langserver', '-mode', 'stdio']},
        \ 'whitelist': ['go'],
        \ })
endif
