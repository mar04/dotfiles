" PLUGINS {{{1
call plug#begin('~/.config/nvim/plugged')
" Plug '/usr/share/vim/vimfiles/'                      "fzf
" Plug 'ntpeters/vim-better-whitespace'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-function'
Plug 'tommcdo/vim-exchange'
Plug 'wellle/targets.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'w0rp/ale'                                     "linting
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Raimondi/delimitMate'                         "completion for ([{
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" Plug 'Valloric/YouCompleteMe'
Plug 'Valloric/ListToggle'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'chrisbra/color_highlight'
Plug 'majutsushi/tagbar'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'mbbill/undotree'
Plug 'morhetz/gruvbox'
Plug 'qpkorr/vim-bufkill'                           "kill buffer without closing splits, etc.
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-abolish'                            "case insensitive replace
Plug 'tpope/vim-characterize'                       "ga to see character name
" Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'                             "extends . repeat to plugins
Plug 'tpope/vim-rsi'                                "emacs style editing in insert mode
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'                         "paired commands
Plug 'AndrewRadev/linediff.vim'                     "diff blocks of text
Plug 'romainl/vim-cool'                             "disable search hl when not needed
Plug 'regedarek/ZoomWin'                            "don't use version 24
call plug#end()
"}}}1
" OPTIONS {{{1
filetype plugin indent on

set foldtext=NeatFoldText()
set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
set linebreak
" set shellcmdflag=-ic           " fucks up vimdiff for whatever reason
set splitbelow
set splitright

" directories {{{2
set backupdir=~/.local/share/vim/backup/
set directory=~/.local/share/vim/swap/
set undodir=~/.local/share/vim/undo/
set viewdir=~/.local/share/vim/views/
"set viminfo+=n~/.local/share/vim/viminfo
"}}}2
" colorscheme and sytax {{{2
set termguicolors
set background=dark
colorscheme gruvbox
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
" use a red blinking block cursor in insert mode
" let &t_SI = "\<Esc>]12;red\x7"
" let &t_SI .= "\<Esc>[2 q"
" use a green nonblinking block cursor otherwise
" let &t_EI = "\<Esc>]12;#83C048\x7"
" let &t_EI .= "\<Esc>[2 q"
" set guicursor=
"}}}2
" history {{{2
" set backup
set nobackup
set nowritebackup
set undofile
"}}}2
" indentation {{{2
set expandtab                   " only spaces
set shiftwidth=4                " number of spaces
set softtabstop=-1              " edit sw of spaces like a single tab
set smartindent                 " on ocasions do smarter indentation
"}}}2
" search {{{2
set ignorecase
set smartcase
"}}}2
" show whitespace {{{2
set listchars="tab:\u25b8 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u26ad"
" set listchars=eol:↵,tab:<->,trail:␣,nbsp:␣,extends:>,precedes:<
set fillchars="vert:\ ,fold:\u00b7"
"}}}2
" ui {{{2
set colorcolumn=+1
" set mouse=   
set noshowmode
set number
set scrolloff=1
"}}}2
" wildmenu {{{2
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
let g:airline_theme='gruvbox'
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
" ale {{{2
let g:ale_linters={'javascript': ['eslint']}
let g:ale_fixers={'javascript':['eslint']}
" let g:ale_linters_explicit=1
let g:ale_sign_error='✗'
let g:ale_sign_warning='⚠'
let g:ale_sign_info='⚠'
let g:ale_sign_style_error='✎'
let g:ale_sign_style_warning='✎'
let g:ale_sign_column_always=1
"}}}2
" better whitespace {{{2
" let g:better_whitespace_ctermcolor='red'
"}}}2
" buffergator {{{2
let g:buffergator_autoexpand_on_split=0
let g:buffergator_display_regime="bufname"
let g:buffergator_suppress_keymaps=1
"}}}2
" cool {{{2
let g:CoolTotalMatches=1
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
" inccomplete {{{2
" let g:inccomplete_sort='ignorecase'
"}}}2
" indentLine {{{2
let g:indentLine_char='┊'
let g:indentLine_enabled=1
let g:indentLine_fileType=['c', 'cpp', 'sh', 'php', 'perl']
" let g:indentLine_fileTypeExclude=['help', 'text', 'html']
"}}}2
" man {{{2
runtime ~/.vim/bundle/man/ftplugin/man.vim
"}}}2
" nerdTree {{{2
let g:NERDTreeMinimalUI=1
let g:NERDTreeShowGitStatus=0
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
" tcomment {{{2
let g:tcomment_textObject_inlineComment=""
" }}}2
" ultisnips {{{2
" let g:UltiSnipsEditSplit='vertical'
" let g:snips_author="Mariusz Libera"
" let g:snips_author_email="mariusz.libera@gmail.com"
" let g:snips_email="mariusz.libera@gmail.com"
" }}}2
" undotree {{{2
let g:undotree_SplitWidth=30
let g:undotree_SetFocusWhenToggle=1
let g:undotree_DiffAutoOpen=0
"}}}2
" youcompleteme {{{2
" set completeopt-=preview
" " let g:ycm_allow_changing_updatetime=0
" " let g:ycm_cache_omnifunc=0
" let g:ycm_collect_identifiers_from_comments_and_strings=1
" " let g:ycm_collect_identifiers_from_tags_files=1
" let g:ycm_complete_in_comments=1
" let g:ycm_confirm_extra_conf=0
" " let g:ycm_complete_in_strings=0
" let g:ycm_filetype_blacklist = { 'python' : 1 }
" let g:ycm_filetype_specific_completion_to_disable = { 'python' : 1 }
" let g:ycm_key_list_previous_completion=['<Up>']
" let g:ycm_key_list_select_completion=['<Down>']
" let g:ycm_path_to_python_interpreter='/bin/python2'
" " let g:ycm_seed_identifiers_with_syntax=1
" let g:ycm_use_ultisnips_completer=1
"}}}2
" zoomwin {{{2
let g:zoomwin_localoptlist=[
				\ "ai"  , "ar"  , "bh"  , "bin", "bl"  ,
				\ "bomb", "bt"  , "cfu" , "ci" , "cin" ,
				\ "cink", "cino", "cinw", "cms", "com" ,
				\ "cpt" , "efm" , "eol" , "ep" , "et"  ,
				\ "fenc", "fex" , "ff"  , "flp", "fo"  ,
				\ "ft"  , "gp"  , "imi" , "ims", "inde",
				\ "inex", "indk", "inf" , "isk",
				\ "kmp" , "lisp", "mps" , "ml" , "ma"  ,
				\ "mod" , "nf"  , "ofu" , "pi" ,
				\ "qe"  , "ro"  , "sw"  , "si" ,
				\ "sts" , "spc" , "spf" , "spl", "sua" ,
				\ "swf" , "smc" , "syn" , "ts" ,
				\ "tw"  , "udf" , "wm"]
"}}}2
"}}}1
" MAPPINGS {{{1
:let mapleader=","
" yankstack {{{2 "FIXME
" must go before any mappings involving y, d, c
nmap <Space>o <Plug>yankstack_substitute_older_paste
nmap <Space>i <Plug>yankstack_substitute_newer_paste
"}}}2
" buffergator {{{2
nnoremap <silent> <Space>b :BuffergatorToggle<CR>
nnoremap <silent> <Space>t :BuffergatorTabsToggle<CR>
"}}}2
" coc {{{2
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" }}}2
" listToggle {{{2
let g:lt_location_list_toggle_map = '<Space>l'
let g:lt_quickfix_list_toggle_map = '<Space>q'
"}}}2
" openTerminal {{{2 "FIXME
" nnoremap <Space>y :exec 'silent !$TERMCMD -e bash -c "cd ' . expand("%:p:h") ' ; bash -i"'<CR>
" }}}2
" ranger {{{2  "FIXME
" nnoremap <Space>r :call RangerChooser()<CR>
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
" symlink {{{2
" nnoremap <Space>s :call FollowSymlink()<CR>
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
" tcomment {{{2
let g:tcomment_mapLeader1=''
let g:tcomment_mapLeader2=''
" noremap <Space>cb :TCommentBlock<CR>
" }}}2
" ultisnips {{{2
" let g:UltiSnipsExpandTrigger="<Tab>"
" let g:UltiSnipsJumpForwardTrigger="<Tab>"
" let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
" let g:UltiSnipsListSnippets="<C-\\>"
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
" nnoremap <Space>gd :YcmCompleter GoToDefinition<CR>
" nnoremap <Space>gD :YcmCompleter GoToDeclaration<CR>
" }}}2
" f1-12 {{{2
nnoremap <F1> <nop>
noremap <F2> :IndentLinesToggle<CR>
noremap <F3> :SyntasticToggleMode<CR>
noremap <F4> :GitGutterToggle<CR>
" <F5> is vdebug run
" noremap <F6> :ColorToggle<CR>
noremap <F7> :RainbowParenthesesToggle<CR>
nnoremap <F9>  :TagbarToggle<CR>
" <F10> is vdebug set_breakpoint
set pastetoggle=<F11>
"}}}2
nnoremap <silent> <C-l> :nohlsearch<CR>
nnoremap <Space><C-l> :redraw!<CR>
nnoremap <silent> <C-w><C-w> :call ToggleTabline()<CR>
nnoremap <Space>m :ShowMap<CR>
" nnoremap ; :
" nnoremap : ;
" vnoremap ; :
" vnoremap : ;
" more natural surround mappings
nmap s ys
vmap s S
" nnoremap <C-s> :w<CR>
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
    let rangerCallback = { 'name': 'ranger' }
    function! rangerCallback.on_exit(id, code)
       silent!  BD!
        try
            if filereadable('/tmp/chosenfile')
                exec system('sed -ie "s/ /\\\ /g" /tmp/chosenfile')
                exec 'argadd ' . system('cat /tmp/chosenfile | tr "\\n" " "')
                exec 'edit ' . system('head -n1 /tmp/chosenfile')
                call system('rm /tmp/chosenfile')
            endif
        endtry
    endfunction
    enew
    call termopen('ranger --choosefiles=/tmp/chosenfile', rangerCallback)
    startinsert
endfunction
"}}}2
" Map {{{2
function! s:ShowMap()
    let old_reg = getreg("a")
    let old_reg_type = getregtype("a")
    try
        redir @a
        silent map | call feedkeys("\<CR>")
        redir END
        vnew
        put a
        %!sort -k1.4,1.4
        setlocal buftype=nowrite
        setlocal bufhidden=delete
        setlocal noswapfile
    finally
        call setreg("a", old_reg, old_reg_type)
    endtry
endfunction
com! ShowMap call s:ShowMap()
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
" source config {{{2
 " Automatically source the config file after editing it.
autocmd bufwritepost $MYVIMRC source $MYVIMRC
"}}}2
"}}}1
" vim: fdm=marker fdl=0 cc=81
