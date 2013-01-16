" Also have a look at :options and :option-list
" check tags and ft-c-omni and omnifunc

runtime bundle/vim-pathogen/autoload/pathogen.vim

execute pathogen#infect()

" This must be first, because it changes other options as a side effect.
set nocompatible	" Use Vim defaults (much better!)
set hidden
set nomodeline
set nowrap		" do not wrap long lines
set number		" show line numbers
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
runtime ftplugin/man.vim
let g:clang_use_library = 1
let g:clang_hl_errors = 1





" SYNTAX ---------------------------------------------------------------------
colorscheme wombat256mod
filetype plugin indent on
set cursorline
set showmatch
syntax on



" SEARCH ---------------------------------------------------------------------
set hlsearch		" highlight matching phrases
set ignorecase		" ignore case while searching also when completing
set incsearch		" incremental search
set smartcase



" EDITING --------------------------------------------------------------------
set autoindent		" keep indentation from previous line
set bs=indent,eol,start	" allow backspacing over everything in insert mode



" INDENTATION ----------------------------------------------------------------
set noexpandtab
set shiftwidth=8
set softtabstop=8
set tabstop=8

set smarttab


set textwidth=78

set showmatch

set shiftround



set wildmenu
set scrolloff=1
set sidescroll=5

if &listchars ==# 'eol:$'
	set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
	if &termencoding ==# 'utf-8' || &encoding ==# 'utf-8'
		let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u26ad"
		let &fillchars = "vert:\u259a,fold:\u00b7"
	endif
endif

set list






" ABBREVIATIONS --------------------------------------------------------------
iabbrev ml Mariusz Libera
iabbrev cpr © Mariusz Libera



set autoread

" Load matchit.vim, but only if the user hasn't installed a newer version.             
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp)
	runtime! macros/matchit.vim
endif


" BACKUP ---------------------------------------------------------------------
set backup		" keep a backup file
"set history=50		" keep 50 lines of command line history
"set viewdir=/home/mariusz/.vim/views,.,/tmp

if isdirectory(expand('~/.cache/vim'))
	if &directory =~# '^\.,'
		set directory^=~/.cache/vim/swap//
	endif
	if &backupdir =~# '^\.,'
		set backupdir^=~/.cache/vim/backup//
	endif
	if exists('+undodir') && &undodir =~# '^\.\%(,\|$\)'
		set undodir^=~/.cache/vim/undo//
	endif
endif
if exists('+undofile')
	set undofile
endif




nnoremap Y y$



"Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
	nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
end

