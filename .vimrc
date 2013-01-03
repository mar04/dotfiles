" Also have a look at :options and :option-list
" check tags and ft-c-omni and omnifunc

" This must be first, because it changes other options as a side effect.
set nocompatible	" Use Vim defaults (much better!)
set hidden
set nomodeline
set nowrap		" do not wrap long lines
set number		" show line numbers
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
runtime ftplugin/man.vim
"set listchars=tab:>-,trail:-
"set list





" BACKUP ---------------------------------------------------------------------
set backupdir=/home/mariusz/.vim/backups,.,/tmp
set backup		" keep a backup file
set directory=/home/mariusz/.vim/swaps,.,/tmp
set history=50		" keep 50 lines of command line history
set viewdir=/home/mariusz/.vim/views,.,/tmp
" have a look at patch backups




" SYNTAX ---------------------------------------------------------------------
colorscheme wombat256
filetype plugin indent on
set cursorline
set showmatch
syntax on





" SEARCH ---------------------------------------------------------------------
set hlsearch		" highlight matching phrases
set ignorecase		" ignore case while searching also when completing
set incsearch		" incremental search
set smartcase



" MOUSE ----------------------------------------------------------------------
"set mouse=a       	" enable mouse





" EDITING --------------------------------------------------------------------
set autoindent		" keep indentation from previous line
set bs=indent,eol,start	" allow backspacing over everything in insert mode
set noexpandtab
set shiftwidth=8
set softtabstop=8
set tabstop=8
set textwidth=80





" ABBREVIATIONS --------------------------------------------------------------
iabbrev ml Mariusz Libera
iabbrev cpr © Mariusz Libera




