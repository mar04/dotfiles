" PATHOGEN {{{1
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
"}}}1
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
" PLUGINS {{{1
" airline {{{2
let g:airline_exclude_preview=1
" let g:airline#extensions#tabline#enabled=1
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
let g:buffergator_autoexpand_on_split=0
let g:buffergator_display_regime="bufname"
let g:buffergator_suppress_keymaps=1
"}}}2
" colorizer {{{2
let g:colorizer_auto_filetype='css,html'
let g:colorizer_fgcontrast=1
"}}}2
" cursorcross {{{2
let g:cursorcross_dynamic='w'
let g:cursorcross_mappings=0
"}}}2
" delimitMate {{{2
let g:delimitMate_expand_cr=1
let g:delimitMate_expand_space=1
let g:delimitMate_jump_expansion=1
let g:delimitMate_balance_matchpairs=1
"}}}2
" gitgutter {{{2
let g:gitgutter_enabled=0
"}}}2
" go {{{2
let g:go_highlight_trailing_whitespace_error=0
"}}}2
" inccomplete {{{2
let g:inccomplete_sort='ignorecase'
"}}}2
" indentLine {{{2
let g:indentLine_char='┊'
let g:indentLine_enabled=1
let g:indentLine_fileType=['c', 'cpp', 'sh', 'php', 'perl']
" let g:indentLine_fileTypeExclude=['help', 'text', 'html']
"}}}2
" lusty {{{2
let g:LustyExplorerDefaultMappings=0
"}}}2
" man {{{2
runtime ~/.vim/bundle/man/ftplugin/man.vim
"}}}2
" nerdTree {{{2
let g:NERDTreeMinimalUI=1
let g:NERDTreeShowGitStatus=0
"}}}2
" php-cs-fixer {{{2
let g:php_cs_fixer_enable_default_mapping=0
"}}}2
" racer {{{2
let g:racer_cmd="/usr/bin/racer"
let $RUST_SRC_PATH="/home/mariusz/var/rust/src"
"}}}2
" syntastic {{{2
let g:syntastic_always_populate_loc_list=1
let g:syntastic_aggregate_errors=1
" let g:syntastic_check_on_open=1
let g:syntastic_error_symbol='✗'
let g:syntastic_full_redraws=0
let g:syntastic_style_error_symbol='✎'
let g:syntastic_style_warning_symbol='✎'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_html_checkers=['jshint', 'w3', 'tidy']
let g:syntastic_css_checkers=['csslint', 'prettycss', 'recess']
let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_php_phpcs_args="--standard=PSR2"
"}}}2
" taboo {{{2
let g:taboo_tab_format='%N:%f  '
" }}}2
" tagbar {{{2
let g:tagbar_autoclose=1
let g:tagbar_autofocus=1
let g:tagbar_compact=1
let g:tagbar_type_snippets={
    \ 'ctagstype' : 'snippets',
    \ 'kinds' : [
        \ 's:snippets',
    \ ]
\ }
" }}}2
" tagbar-phpctags {{{2
let g:tagbar_phpctags_bin="~/code/git/phpctags/phpctags"
" }}}2
" tcomment {{{2
let g:tcommentTextObjectInlineComment=""
" }}}2
" ultisnips {{{2
let g:UltiSnipsEditSplit='vertical'
let g:snips_author="Mariusz Libera"
let g:snips_author_email="mariusz.libera@gmail.com"
let g:snips_email="mariusz.libera@gmail.com"
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
" let g:ycm_allow_changing_updatetime=0
" let g:ycm_cache_omnifunc=0
let g:ycm_collect_identifiers_from_comments_and_strings=1
" let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_complete_in_comments=1
let g:ycm_confirm_extra_conf=0
" let g:ycm_complete_in_strings=0
let g:ycm_filetype_blacklist = { 'python' : 1 }
let g:ycm_filetype_specific_completion_to_disable = { 'python' : 1 }
let g:ycm_key_list_previous_completion=['<Up>']
let g:ycm_key_list_select_completion=['<Down>']
let g:ycm_path_to_python_interpreter='/bin/python2'
" let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_use_ultisnips_completer=1
"}}}2
"}}}1
" MAPPINGS {{{1
" yankstack {{{2
" must go before any mappings involving y, d, c
nmap <Space>o <Plug>yankstack_substitute_older_paste
nmap <Space>i <Plug>yankstack_substitute_newer_paste
"}}}2
" buffergator {{{2
nnoremap <silent> <Space>b :BuffergatorToggle<CR>
nnoremap <silent> <Space>t :BuffergatorTabsToggle<CR>
"}}}2
" listToggle {{{2
let g:lt_location_list_toggle_map = '<Space>l'
let g:lt_quickfix_list_toggle_map = '<Space>q'
"}}}2
" lusty {{{2
nnoremap <Space>k :LustyBufferExplorer<CR>
nnoremap <Space>v :LustyBufferGrep<CR>
nnoremap <Space>h :LustyFilesystemExplorer<CR>
nnoremap <Space>f :LustyFilesystemExplorerFromHere<CR>
"}}}2
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
" tabularize {{{2
noremap <Space>a :Tabularize /
"}}}2
" tagbar {{{2
noremap <silent> <Space>p :TagbarToggle<CR>
"}}}2
" tcomment {{{2
let g:tcommentMapLeader1=''
let g:tcommentMapLeader2=''
noremap <Space>cb :TCommentBlock<CR>
" }}}2
" toggleComments {{{2
" all comments change foreground color to background becoming invisible
" works with my custom function in gruvbox theme
nnoremap <Space>ct :call gruvbox#comment_toggle()<CR>
"}}}2
" ultisnips {{{2
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
let g:UltiSnipsListSnippets="<C-\\>"
" }}}2
" undotree {{{2
noremap <Space>u :UndotreeToggle<CR>
"}}}2
" upper/lower {{{2
nnoremap gu gU
nnoremap guu gUU
nnoremap gl gu
nnoremap gll guu
" }}}2
" youcompleteme {{{2
nnoremap <Space>gd :YcmCompleter GoToDefinition<CR>
nnoremap <Space>gD :YcmCompleter GoToDeclaration<CR>
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
" TODO {{{1
"TODO: run bash commands in interactive mode - so aliases and functions and
"everything else works as expected
"TODO: c macro expansion
"TODO: play with cinoptions
"TODO: use ctrl-h ctrl-l ctrl-k s ctrl-y ctrl-e
"TODO: use ctrl-n and ctrl-p like emacs in insert mode, but only if there is no completion
"TODO: buffergator - option to save selected buffers
"TODO: delete in line dil
"TODO: paste in line pil consider pasting a text with newline inline
"TODO: yank in line yil
"}}}1
" POSSIBLE {{{1


"vnoremap _g y:exe "grep /" . escape(@", '\\/') . "/ *.c *.h"<CR>

"" F7: Find word under in all files in current dir or subdirectories
""map <F7> :execute "vimgrep /" . expand("<cword>") . "/j **/*." . expand('%:e') <Bar> cw<CR>
""map <F7> :execute "vimgrep /" . expand("<cword>") . "/j **/*." . expand('%:e')<CR>
"map <F7> :execute "vimgrep /" . expand("<cword>") . "/j **/*.tmpl **/*.py **/*.cc **/*.c **/*.cxx **/*.cpp **/*.h"<CR>
"

" F12: Rebuild ctags database
"map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"}}}1
" vim: fdm=marker fdl=0 cc=81
