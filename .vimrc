" OPTIONS {{{1
set nocompatible
filetype plugin indent on

set backspace=indent,eol,start
set foldtext=NeatFoldText()
set hidden
set linebreak
" set shellcmdflag=-ic           " fucks up vimdiff for whatever reason
set splitbelow
set splitright

" directories {{{2
set backupdir=$XDG_CACHE_HOME/backup
set directory=$XDG_CACHE_HOME/vim/swap
set undodir=$XDG_CACHE_HOME/vim/undo
set viewdir=$XDG_CACHE_HOME/vim/views
set viminfo+=n$XDG_CACHE_HOME/vim/viminfo
set runtimepath=$XDG_CONFIG_HOME/vim,$VIMRUNTIME,$XDG_CONFIG_HOME/vim/after
"}}}2
" colorscheme and sytax {{{2
colorscheme slate
" goes after colorscheme
syntax enable
" help with long lines slowness
set synmaxcol=200
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
set guifont=Ubuntu\ Mono\ 12
set guioptions=ac
set guiheadroom=0
set guicursor=n-v-c-ve-o:block-blinkon0-Cursor
set guicursor+=i-ci:ver25-blinkon0-iCursor
set guicursor+=r-cr:hor20-blinkon0-iCursor
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
set mouse=a
set noshowmode
"}}}2
" wildmenu {{{2
set wildmenu

" Suffixes that get lower priority when doing tab completion for filenames.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
"}}}2
"}}}1
" MAPPINGS {{{1
" openTerminal {{{2
nnoremap <Space>y :exec 'silent !$TERMCMD -e bash -c "cd ' . expand("%:p:h") ' ; bash -i"'<CR>
" }}}2
" ranger {{{2
nnoremap <Space>r :call RangerChooser()<CR>
" }}}2
" readline {{{2
" some readline/emacs like keybindings missing from rsi plugin
inoremap <C-_> <C-o>u
inoremap <C-k> <C-o>D
cnoremap <C-k> <C-f>D<C-c>
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>
"}}}2
" sudo save {{{2
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
" }}}2
" symlink {{{2
nnoremap <Space>s :call FollowSymlink()<CR>
" }}}2
" tabs {{{2
nnoremap <Space>gt :call MoveToNextTab()<CR>
nnoremap <Space>gT :call MoveToPrevTab()<CR>
nnoremap <C-n> gt
nnoremap <C-p> gT
nnoremap <C-w>t :tabnew<CR>
nnoremap <C-w><C-t> :tabnew<CR>
" redirect command output to a buffer in a new tab
nnoremap <Space>: :TabMessage 
"}}}2
" upper/lower {{{2
nnoremap gu gU
nnoremap guu gUU
nnoremap gl gu
nnoremap gll guu
" }}}2
" f1-12 {{{2
noremap <F2> :IndentLinesToggle<CR>
noremap <F3> :SyntasticToggleMode<CR>
noremap <F4> :GitGutterToggle<CR>
" <F5> is vdebug run
" noremap <F6> :ColorToggle<CR>
noremap <F7> :RainbowParenthesesToggle<CR>
" <F10> is vdebug set_breakpoint
set pastetoggle=<F11>
"}}}2
nnoremap <silent> <C-l> :nohlsearch<CR>
nnoremap <Space><C-l> :redraw!<CR>
nnoremap <silent> <C-w><C-w> :call ToggleTabline()<CR>
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;
" more natural surround mappings
nmap s ys
vmap s S
nnoremap <C-s> :w<CR>
" change directory to that of current file
nnoremap <Space>cd :cd %:p:h<CR>
" trim whitespace from end of lines
nnoremap <Space>z :%s/\s\+$//
vnoremap <Space>z :s/\s\+$//
" split line
nnoremap <Space><CR> a\\k
noremap Y y$
noremap Q gq
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
" MoveToTab {{{2
function! MoveToPrevTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() != 1
    close!
    if l:tab_nr == tabpagenr('$')
      tabprev
    endif
    sp
  else
    close!
    exe "0tabnew"
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc

function! MoveToNextTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() < tab_nr
    close!
    if l:tab_nr == tabpagenr('$')
      tabnext
    endif
    sp
  else
    close!
    tabnew
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc
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
" TabMessage {{{2
" redirect cmd output to a buffer in a new tab
function! TabMessage(cmd)
    redir => message
    silent execute a:cmd
    redir END
    tabnew
    silent put=message
    set nomodified
endfunction
command! -nargs=+ -complete=command TabMessage call TabMessage(<q-args>)
"}}}2
" ToggleTabline {{{2
function! ToggleTabline()
    if &showtabline
        set showtabline=0
    else
        set showtabline=2
    endif
endfunction
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
" checktime {{{2
" check more often if the file is modified outside of vim
augroup CheckTime
    au BufWinEnter * checktime
    au CursorHold  * checktime
    au CursorHoldI * checktime
augroup END
"}}}2
" keepCursorPosition {{{2
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" position when opening a file.
autocmd BufReadPost *
            \ if line("'\"") > 1 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif
"}}}2
" parentDir {{{2
 " Automatically create parent directory on save if directory doesn't exist
au BufWritePre * if expand("<afile>")!~#'^\w\+:/' && !isdirectory(expand("%:h")) | execute "silent! !mkdir -p ".shellescape(expand('%:h'), 1) | redraw! | endif
"}}}2
"}}}1
" vim: fdm=marker fdl=0 cc=81
