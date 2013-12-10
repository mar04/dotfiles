" PATHOGEN ---------------------------------------------------------------{{{1
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
"}}}1
" OPTIONS ----------------------------------------------------------------{{{1
set nocompatible
filetype plugin indent on

set autoread
set backspace=indent,eol,start
set hidden
set linebreak
"set shellcmdflag=-ic           " fucks up vimdiff for whatever reason
set splitbelow
set splitright
set tabpagemax=50
"set textwidth=78

" directories ------------------------------------------------------------{{{2
set backupdir=~/.local/share/vim/backup/
set directory=~/.local/share/vim/swap/
set undodir=~/.local/share/vim/undo/
set viewdir=~/.local/share/vim/views/
set viminfo+=n~/.local/share/vim/viminfo
"}}}2
" colorscheme and sytax --------------------------------------------------{{{2
if $TERM == "linux" && !has('gui_running')
    colorscheme slate
else
    set background=dark
    colorscheme gruvbox
endif

" goes after colorscheme
syntax on
"}}}2
" cursor -----------------------------------------------------------------{{{2
" change cursor shape and color in different modes
" 1 or 0 -> blinking block
" 2 -> solid block
" 3 -> blinking underscore
" 4 -> solid underscore
" Recent versions of xterm (282 or above) also support
" 5 -> blinking vertical bar
" 6 -> solid vertical bar
if &term =~ 'xterm\|rxvt'
    " use a red blinking block cursor in insert mode
    let &t_SI = "\<Esc>]12;red\x7"
    let &t_SI .= "\<Esc>[1 q"
    " use a green nonblinking block cursor otherwise
    let &t_EI = "\<Esc>]12;#fabd2f\x7"
    let &t_EI .= "\<Esc>[2 q"
endif
"}}}2
" gui  -------------------------------------------------------------------{{{2
set guifont=Ubuntu\ Mono\ 12
set guioptions=ace
"}}}2
" history ----------------------------------------------------------------{{{2
set backup
set history=50
set undofile
"}}}2
" indentation ------------------------------------------------------------{{{2
set expandtab                   " only spaces
set shiftwidth=4                " number of spaces
set softtabstop=-1              " edit sw of spaces like a single tab
set autoindent                  " keep indentation from previous line
set smartindent                 " on ocasions do smarter indentation
"}}}2
" search -----------------------------------------------------------------{{{2
set incsearch
set hlsearch
set ignorecase
set smartcase
"}}}2
" show whitespace --------------------------------------------------------{{{2
"set list
if &listchars ==# 'eol:$'
    set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
    if &termencoding ==# 'utf-8' || &encoding ==# 'utf-8'
        let &listchars = "tab:\u25b8 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u26ad"
        let &fillchars = "vert:\u259a,fold:\u00b7"
    endif
endif
"}}}2
" ui ---------------------------------------------------------------------{{{2
"set colorcolumn=+1
set laststatus=2
set matchtime=3
set mouse=a
"set number
"set relativenumber
set ruler
set showcmd
set showmatch
set showmode
"}}}2
" wildmenu ---------------------------------------------------------------{{{2
set wildmenu
set wildmode=longest:full,full

" Suffixes that get lower priority when doing tab completion for filenames.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
"}}}2
"}}}1
" PLUGINS ---------------------------------------------------------------{{{1
" man -------------------------------------------------------------------{{{2
runtime ftplugin/man.vim
"}}}2
"let g:sneak#streak=1
"let g:seank#use_ic_scs=1
" }}}2
" syntastic -------------------------------------------------------------{{{2
let g:syntastic_check_on_open=1
let g:syntastic_error_symbol='✗✗'
let g:syntastic_warning_symbol='!!'
let g:syntastic_style_error_symbol='✎✗'
let g:syntastic_style_warning_symbol='✎!'
"}}}2
" undotree ---------------------------------------------------------------{{{2
let g:undotree_SplitWidth=30
let g:undotree_SetFocusWhenToggle=1
let g:undotree_DiffAutoOpen=0
"}}}2
" yankstack --------------------------------------------------------------{{{2
let g:yankstack_map_keys=0
call yankstack#setup()
"}}}2
"}}}1
" MAPPINGS ---------------------------------------------------------------{{{1
" yankstack --------------------------------------------------------------{{{2
" must go before any mappings involving y, d, c
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste
"}}}2
" auto-pairs -------------------------------------------------------------{{{2
let g:AutoPairsCenterLine=0
let g:AutoPairsFlyMode=1
"}}}2
" readline  --------------------------------------------------------------{{{2
" some readline/emacs like keybindings missing from rsi plugin
inoremap <C-_> <C-o>u
inoremap <C-k> <C-o>D
cnoremap <C-k> <C-f>D<C-c>
"}}}2
" f1-12  -----------------------------------------------------------------{{{2
noremap <F2> :call CharTillTw("-")<CR>
inoremap <F2> <Esc>:call CharTillTw("-")<CR>
nnoremap <F3> :set number!<CR>:set relativenumber!<CR>
inoremap <F3> <Esc>:set number!<CR>:set relativenumber!<CR>i
nnoremap <F4> :set list!<CR>
inoremap <F4> <Esc>:set list!<CR>i
nnoremap <F5> :UndotreeToggle<CR>
nnoremap <F6> :TagbarToggle<CR>
nnoremap <F7> :NERDTreeToggle<CR>
"}}}2

noremap Y y$
noremap Q gq
nnoremap <C-l> :nohlsearch<CR>
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

"let mapleader = ","
"let g:mapleader = ","

":%s/\s\+$// - trim whitespace from end of lines

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
              \ | wincmd p | diffthis
endif

"}}}1
" FUNCTIONS --------------------------------------------------------------{{{1
" CharTillTw -------------------------------------------------------------{{{2
"if !exists("CharTillTw")
    function! CharTillTw(char)
        if virtcol("$") < &tw
            execute "normal A \<Esc>"
        else
            return
        endif
        execute "normal" . (&tw - virtcol("$") + 1) . "A" . a:char . "\<Esc>"
    endfunction
"endif
"}}}2
"}}}1
" AUTOCOMMANDS -----------------------------------------------------------{{{1
" vimrcEx  ---------------------------------------------------------------{{{2
" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
    au!
    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " position when opening a file.
    autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
augroup END
"}}}2
" binary  ----------------------------------------------------------------{{{2
" TODO: autodetect binary?
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
"}}}2
"}}}1
" ABBREVIATIONS ----------------------------------------------------------{{{1
iabbrev ml Mariusz Libera
iabbrev mtr # Maintainer: Mariusz Libera <mariusz.libera@gmail.com>
iabbrev cpr © Mariusz Libera
"}}}1
" TODO -------------------------------------------------------------------{{{1
"TODO: run bash commands in interactive mode - so aliases and functions and
"everything else works as expected
"TODO: efficient tabs and buffers switching
"TODO: help and completion windows should be autohiding or easily closing
"TODO: nice, emacs like adwaita light colorscheme
"TODO: s and S are rarely used so could be remapped to something else
"TODO: while restoring a file from swap file auto launch diff with original
"file
"TODO: ^q seems useless
"TODO: remap ^x in insert mode to something easier to press
"TODO: investigate omnicompletion and alternatives
"TODO: c macro expansion
"TODO: xml and/or html tags showmatch
"TODO: play with cinoptions
"TODO: enable syntax folding in some filetypes
"TODO: add paste_toggle keybinding
"TODO: better leader mapping
"}}}1
" POSSIBLE ---------------------------------------------------------------{{{1
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


" seems to be file specific
" formatoptions:
" c - autowrap COMMENTS using textwidth
" r - insert comment leader (?) on <enter>
" o - insert comment leader on 'o' or 'O'
" q - gq formats comments (?)
" n - recon numbered lists
" v - wrap on blanks
" t - autowrap TEXT using textwidth
"set fo=croqnvt

"vnoremap _g y:exe "grep /" . escape(@", '\\/') . "/ *.c *.h"<CR>


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
"}}}1
" vim: fdm=marker fdl=0
