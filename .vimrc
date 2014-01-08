" PATHOGEN {{{1
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
"}}}1
" OPTIONS {{{1
set nocompatible
filetype plugin indent on

set autoread
set backspace=indent,eol,start
set foldtext=NeatFoldText()
set hidden
set linebreak
" set shellcmdflag=-ic           " fucks up vimdiff for whatever reason
set splitbelow
set splitright
set tabpagemax=50

" directories {{{2
set backupdir=~/.local/share/vim/backup/
set directory=~/.local/share/vim/swap/
set undodir=~/.local/share/vim/undo/
set viewdir=~/.local/share/vim/views/
set viminfo+=n~/.local/share/vim/viminfo
"}}}2
" colorscheme and sytax {{{2
if $TERM == "linux" && !has('gui_running')
    colorscheme slate
else
    set background=dark
    colorscheme gruvbox
endif

" goes after colorscheme
syntax on
" help with long lines slowness
" set synmaxcol=128
"}}}2
" cursor {{{2
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
    let &t_SI .= "\<Esc>[2 q"
    " use a green nonblinking block cursor otherwise
    let &t_EI = "\<Esc>]12;#83C048\x7"
    let &t_EI .= "\<Esc>[2 q"
endif
"}}}2
" gui {{{2
set guifont=Ubuntu\ Mono\ 11
set guioptions=ace
"}}}2
" history {{{2
set backup
set history=50
set undofile
"}}}2
" indentation {{{2
set expandtab                   " only spaces
set shiftwidth=4                " number of spaces
set softtabstop=-1              " edit sw of spaces like a single tab
set autoindent                  " keep indentation from previous line
set smartindent                 " on ocasions do smarter indentation
"}}}2
" search {{{2
set incsearch
set hlsearch
set ignorecase
set smartcase
"}}}2
" show whitespace {{{2
if &listchars ==# 'eol:$'
    set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
    if &termencoding ==# 'utf-8' || &encoding ==# 'utf-8'
        let &listchars = "tab:\u25b8 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u26ad"
        let &fillchars = "vert:\ ,fold:\u00b7"
    endif
endif
"}}}2
" ui {{{2
set colorcolumn=+1
set laststatus=2
set matchtime=3
set mouse=a
set noshowmode
set ruler
set showcmd
set showmatch
"}}}2
" wildmenu {{{2
set wildmenu
set wildmode=longest:full,full

" Suffixes that get lower priority when doing tab completion for filenames.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
"}}}2
"}}}1
" PLUGINS {{{1
" airline {{{2
let g:airline_exclude_preview=1
let g:airline#extensions#tagbar#enabled=0
let g:airline_inactive_collapse=0
let g:airline_theme='mariusz'
let g:airline_mode_map = {
            \ '__' : '-',
            \ 'n'  : 'n',
            \ 'i'  : 'i',
            \ 'R'  : 'R',
            \ 'c'  : 'c',
            \ 'v'  : 'v',
            \ 'V'  : 'V',
            \ '' : '^v',
            \ 's'  : 's',
            \ 'S'  : 'S',
            \ '' : '^s',
            \ }
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_symbols.linenr=''
let g:airline_symbols.whitespace='Ξ'
"}}}2
" buffergator {{{2
let g:buffergator_suppress_keymaps=1
"}}}2
" gitgutter {{{2
let g:gitgutter_enabled=0
"}}}2
" indentLine {{{2
let g:indentLine_char = '┊'
"}}}2
" listToggle {{{2
let g:lt_location_list_toggle_map = '<Space>l'
let g:lt_quickfix_list_toggle_map = '<Space>q'
"}}}2
" man {{{2
runtime ftplugin/man.vim
"}}}2
" syntastic {{{2
let g:syntastic_always_populate_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_error_symbol='✗'
let g:syntastic_full_redraws=0
let g:syntastic_style_error_symbol='✗'
let g:syntastic_style_warning_symbol='✎'
let g:syntastic_warning_symbol='⚠'
"}}}2
" taboo {{{2
let g:taboo_tab_format='%N:%f  '
" }}}2
" tcomment {{{2
"let g:tcomment#rstrip_on-uncomment=2
"}}}2
" ultisnips {{{2
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
let g:UltiSnipsListSnippets="<C-\\>"
" }}}2
" undotree {{{2
let g:undotree_SplitWidth=30
let g:undotree_SetFocusWhenToggle=1
let g:undotree_DiffAutoOpen=0
"}}}2
" yankstack {{{2
let g:yankstack_map_keys=0
call yankstack#setup()
"}}}2
" youcompleteme {{{2
set completeopt-=preview
let g:ycm_allow_changing_updatetime=0
let g:ycm_confirm_extra_conf=0
let g:ycm_key_list_select_completion=['<Down>']
let g:ycm_key_list_previous_completion=['<Up>']
let g:ycm_use_ultisnips_completer=1
"}}}2
" xptemplate {{{2
let g:xptemplate_vars=''
let g:xptemplate_vars.='&name=Mariusz Libera'
let g:xptemplate_vars.='&author=Mariusz Libera'
let g:xptemplate_vars.='&email=mariusz.libera@gmail.com'
"}}}2
"}}}1
" MAPPINGS {{{1
" yankstack {{{2
" must go before any mappings involving y, d, c
nmap <Space>o <Plug>yankstack_substitute_older_paste
nmap <Space>i <Plug>yankstack_substitute_newer_paste
"}}}2
" buffergator {{{2
nnoremap <Space>b :BuffergatorToggle<CR>
nnoremap <Space>t :BuffergatorTabsToggle<CR>
"}}}2
" gitgutter {{{2
nnoremap cogg :GitGutterToggle<CR>
"}}}2
" ranger {{{2
map <Space>r :call RangerChooser()<CR>
" }}}2
" openTerminal {{{2
nnoremap <Space>y :exec 'silent !$TERMCMD -e bash -c "cd ' . expand("%:p:h") ' ; bash -i"'<CR>
" }}}2
" readline {{{2
" some readline/emacs like keybindings missing from rsi plugin
inoremap <C-_> <C-o>u
inoremap <C-k> <C-o>D
cnoremap <C-k> <C-f>D<C-c>
"}}}2
" symlink {{{2
map <Space>s :call FollowSymlink()<CR>
" }}}2
" tabularize {{{2
nnoremap <Space>a :Tabularize /
vnoremap <Space>a :Tabularize /
"}}}2
" tagbar {{{2
nnoremap <Space>p :TagbarToggle<CR>
"}}}2
" undotree {{{2
nnoremap <Space>u :UndotreeToggle<CR>
"}}}2
" youcompleteme {{{2
nnoremap <Space>gd :YcmCompleter GoToDefinition<CR>
nnoremap <Space>gD :YcmCompleter GoToDeclaration<CR>
" }}}2
" f1-12 {{{2
noremap <F2> :call CharTillTw("-")<CR>
inoremap <F2> <Esc>:call CharTillTw("-")<CR>
nnoremap <F3> :set number!<CR>:set relativenumber!<CR>
inoremap <F3> <Esc>:set number!<CR>:set relativenumber!<CR>i
nnoremap <F4> :set list!<CR>
inoremap <F4> <Esc>:set list!<CR>i
noremap <F5> :RainbowParenthesesToggle<CR>
inoremap <F5> <Esc>:RainbowParenthesesToggle<CR>i
"}}}2

nnoremap <Space><C-l> :redraw!<CR>
noremap Y y$
noremap Q gq
nnoremap <C-l> :nohlsearch<CR>
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>
"}}}1
" FUNCTIONS {{{1
" AutoClosePreviewWindow {{{2
function! AutoClosePreviewWindow()
    if !&l:previewwindow
        pclose
    endif
endfunction
" }}}2
" CharTillTw {{{2
function! CharTillTw(char)
    if virtcol("$") < &tw
        execute "normal A \<Esc>"
    else
        return
    endif
    execute "normal" . (&tw - virtcol("$") + 1) . "A" . a:char . "\<Esc>"
endfunction
"}}}2
" DiffOrig {{{2
" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif
"}}}2
" FollowSymlink {{{2
" Follow symlinks so we're editing the actual file instead of the symlink
" (change the value retiurned by %).
" Uses vim-bufkill if available.

" Wipe the current buffer and load the file that the symlink points to.
function! FollowSymlink()
    let fname = resolve(expand('%:p'))
    " Use bufkill to clear the buffer, but not close the window.
    BW
    exec "edit " . fname
endfunction
"}}}2
" NeatFoldText {{{2
function! NeatFoldText()
    let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
    let lines_count = v:foldend - v:foldstart + 1
    let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
    let foldchar = matchstr(&fillchars, 'fold:\zs.')
    let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
    let foldtextend = lines_count_text . repeat(foldchar, 8)
    let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
    return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
"}}}2
" RangerChooser {{{2
function! RangerChooser()
    if has('gui_running')
        exec "silent !$TERMCMD -e ranger --choosefiles=/tmp/chosenfile " . expand("%:p:h")
    else
        exec "silent !ranger --choosefiles=/tmp/chosenfile " . expand("%:p:h")
    endif
    if filereadable('/tmp/chosenfile')
        exec system('escspc /tmp/chosenfile')
        exec 'argadd ' . system('cat /tmp/chosenfile | tr "\\n" " "')
        exec 'edit ' . system('head -n1 /tmp/chosenfile')
        call system('rm /tmp/chosenfile')
    endif
    redraw!
endfun
"}}}2
"}}}1
" AUTOCOMMANDS {{{1
" autoClosePreviewWindow {{{2
autocmd InsertLeave * call AutoClosePreviewWindow()
" }}}2
" binary {{{2
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
" filetypedetect {{{2
augroup filetypedetect
    au BufNewFile,BufRead .tmux.conf*,tmux.conf* set ft=tmux
augroup END
" }}}2
" vimrcEx {{{2
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
"}}}1
" ABBREVIATIONS {{{1
iabbrev ml Mariusz Libera
iabbrev mtr # Maintainer: Mariusz Libera <mariusz.libera@gmail.com>
iabbrev cpr © Mariusz Libera
"}}}1
" TODO {{{1
"TODO: run bash commands in interactive mode - so aliases and functions and
"everything else works as expected
"TODO: help and completion windows should be autohiding or easily closing
"TODO: c macro expansion
"TODO: play with cinoptions
"TODO: enable syntax folding in some filetypes
"TODO: add paste_toggle keybinding
"}}}1
" POSSIBLE {{{1

":%s/\s\+$// - trim whitespace from end of lines

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


"" F5: Tag list
"imap <silent> <F5> :Tlist<CR>
"map <silent> <F5> :Tlist<CR>
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
" vim: fdm=marker fdl=0 tw=78 cc=+1
