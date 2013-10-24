" Also have a look at :options and :option-list
" check tags and ft-c-omni and omnifunc

runtime bundle/plugin-pathogen/autoload/pathogen.vim

execute pathogen#infect()

" This must be first, because it changes other options as a side effect.
set nocompatible	" Use Vim defaults (much better!)



"let g:clang_use_library = 1
"let g:clang_hl_errors = 1

"let g:netrw_http_xcmd='-source >'
"let g:Tlist_Sort_Type='name'
"let g:Tlist_Auto_Highlight_Tag=1
"let g:Tlist_Display_Prototype=0
"let g:Tlist_Display_Tag_Scope=1
"let g:Tlist_Compact_Format=0
"let g:Tlist_Use_Right_Window=0
"let g:Tlist_Exit_OnlyWindow=1
"let g:Tlist_Show_One_File=1
"let g:Tlist_WinWidth=40
"let g:Tlist_Enable_Fold_Column=0
"let g:C_CFlags = "-Wall"
"
"let g:NERDTreeChDirMode=0
"let g:NERDTreeWinSize=40
""0=right/bottom 1=top/left
"let g:NERDTreeWinPos="right"
"let g:bufExplorerUseCurrentWindow=1
"
"let tlist_d_settings='c++;d:macro;g:enum;s:struct;u:union;t:typedef;v:variable;f:function;c:class;T:template;p:abstract;X:mixin;m:member;M:module'
"let tlist_htmljinja_settings='html;a:anchor;f:javascript function'
"
"runtime plugin/taglist.vim
"runtime plugin/themes.vim
"runtime plugin/bufexplorer.vim
"runtime plugin/a.vim

" Automatically close preview window when not needed anymore
"autocmd InsertLeave * call AutoClosePreviewWindow()
"autocmd CursorMovedI * call AutoClosePreviewWindow()
"
"function! AutoClosePreviewWindow()
"	if !&l:previewwindow
"		pclose
"	endif
"endfunction

" Skeleton plugin and manual file type detection
"if has("autocmd")
"	autocmd BufEnter *.di :set filetype=d
"	autocmd Filetype java setlocal omnifunc=javacomplete#Complete
"
"	autocmd BufNewFile *.h TSkeletonSetup cxx_header.h
"	autocmd BufNewFile *.ml TSkeletonSetup ocaml.ml
"endif

set hidden
set nomodeline
set nowrap		" do not wrap long lines
set number		" show line numbers
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
runtime ftplugin/man.vim

"set foldmethod=syntax

"set shellcmdflag="-ic'


" SYNTAX ---------------------------------------------------------------------
if $TERM == "linux"
	colorscheme slate
else
	colorscheme zenburn
	set cursorline
endif

if has('gui_running')
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guicursor+=a:blinkon0
	set guifont=Ubuntu\ Mono\ 12
	set cursorline
	colorscheme jellybeans
endif

filetype plugin indent on
set showmatch
syntax on

"set showtabline=1
"set cmdheight=1
"set laststatus=1

" SEARCH ---------------------------------------------------------------------
set hlsearch		" highlight matching phrases
set ignorecase		" ignore case while searching also when completing
set incsearch		" incremental search
set smartcase



" EDITING --------------------------------------------------------------------
set autoindent		" keep indentation from previous line
set bs=indent,eol,start	" allow backspacing over everything in insert mode
"set wrap " If a line is too long for display, wrap it
"set cin  " C-Indentation
"set smartindent



" INDENTATION ----------------------------------------------------------------
"set noexpandtab
"set shiftwidth=8
"set softtabstop=8
"set tabstop=8
set expandtab
set shiftwidth=4
"set softtabstop=4
set tabstop=4
"set fdm=indent   " Fold by indentation
"set nolbr         " lbr=wrap on word boundaries (for display-only-wrapping)
"set sm            " Shortly jump to matching bracket
set list

set smarttab

" formatoptions:
" c - autowrap COMMENTS using textwidth
" r - insert comment leader (?) on <enter>
" o - insert comment leader on 'o' or 'O'
" q - gq formats comments (?)
" n - recon numbered lists
" v - wrap on blanks
" t - autowrap TEXT using textwidth
"set fo=croqnvt


set textwidth=78
"set colorcolumn=79
set cc=+1
"let &colorcolumn=join(range(79,256),",")

set showmatch

set shiftround

autocmd BufWritePost .vimrc source %


set wildmenu
set scrolloff=1
set sidescroll=5

if &listchars ==# 'eol:$'
	set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
	if &termencoding ==# 'utf-8' || &encoding ==# 'utf-8'
		"let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u26ad"
		let &listchars = "tab:\u25b8 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u26ad"
		let &fillchars = "vert:\u259a,fold:\u00b7"
	endif
endif


"set list



nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>


" ABBREVIATIONS --------------------------------------------------------------
iabbrev ml Mariusz Libera
iabbrev mtr # Maintainer: Mariusz Libera <mariusz.libera@gmail.com>
iabbrev cpr © Mariusz Libera

" Let Control-S be 'save' as it is in most other editors
" Thanks Leo for the tip :)
map <C-s> :w<CR>
imap <C-s> <C-o>:w<CR>

" source: http://vim.wikia.com/wiki/VimTip102
" Let <Tab> do all the autocompletion
"function! Smart_TabComplete()
"	let line = getline('.') 					" curline
"	let substr = strpart(line, -1, col('.'))	" from start to cursor
"	let substr = matchstr(substr, "[^ \t]*$")	" word till cursor
"	if (strlen(substr)==0)						" nothing to match on empty string
"		return "\<tab>"
"	endif
"	let has_period = match(substr, '\.') != -1	" position of period, if any
"	let has_slash = match(substr, '\/') != -1	" position of slash, if any
"	if (!has_period && !has_slash)
"		return "\<C-X>\<C-P>"					" existing text matching
"	elseif ( has_slash )
"		return "\<C-X>\<C-F>"					" file matching
"	else
"		return "\<C-X>\<C-O>"					" plugin matching
"	endif
"endfunction
"inoremap <tab> <c-r>=Smart_TabComplete()<CR>

set autoread

" Load matchit.vim, but only if the user hasn't installed a newer version.             
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp)
	runtime! macros/matchit.vim
endif

"" F2: Comment selected Block with #'s
"map <F2> :s/^\(.*\)$/#\1/g<CR>
"
"" F3: Uncomment selected Block thats commented with #'s
"map <F3> :s/^#//g<CR>
"
"" F4: Buffer list
"map <silent> <F4> :BufExplorer<CR>
"
"" F5: Tag list
"imap <silent> <F5> :Tlist<CR>
"map <silent> <F5> :Tlist<CR>
"
"" F6: File list
"map <silent> <F6> :NERDTreeToggle<CR>
"
"" F7: Find word under in all files in current dir or subdirectories
""map <F7> :execute "vimgrep /" . expand("<cword>") . "/j **/*." . expand('%:e') <Bar> cw<CR>
""map <F7> :execute "vimgrep /" . expand("<cword>") . "/j **/*." . expand('%:e')<CR>
"map <F7> :execute "vimgrep /" . expand("<cword>") . "/j **/*.tmpl **/*.py **/*.cc **/*.c **/*.cxx **/*.cpp **/*.h"<CR>
"
"" ,cd: Change directory to that of current file
"map ,cd :cd %:p:h<CR>

" F12: Rebuild ctags database
"map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>


" BACKUP ---------------------------------------------------------------------
set backup		" keep a backup file
"set history=50		" keep 50 lines of command line history
"set viewdir=/home/mariusz/.vim/views,.,/tmp

if isdirectory(expand('~/.cache/vim'))
	set viminfo+=n~/.cache/vim/viminfo
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


"set modeline
"set modelines=5
"set spelllang=de
"set hls        " highlight search
"set ignorecase " ignore case when searching
"set smartcase  " ... except when search pattern contains an uppercase char

" vim -b : edit binary using xxd-format!
augroup Binary
    au!
    au BufReadPre  *.o let &bin=1
    au BufReadPost *.o if &bin | %!xxd
    au BufReadPost *.o set ft=xxd | endif
    au BufWritePre *.o if &bin | %!xxd -r
    au BufWritePre *.o endif
    au BufWritePost *.o if &bin | %!xxd
    au BufWritePost *.o set nomod | endif
augroup END

nnoremap Y y$

"let mapleader = ","
"let g:mapleader = ","


"Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
	nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
end

