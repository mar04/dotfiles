" let php_asp_tags=1
" let php_baselib=1
" let php_noShortTags=1
" let php_sync_method=0
NoMatchParen
let php_folding=1
let php_htmlInStrings=1
let php_parent_error_close=1
let php_parent_error_open=1
" let php_sql_query=1
nmap <buffer> K K<CR>
nmap <buffer> <Space>x :w<CR>:call PhpCsFixerFixFile()<CR>:e<CR>
" nmap <buffer> <Space>z :call PhpCsFixerFixDirectory()<CR>
setlocal keywordprg=~/bin/vphpdoc
setlocal number
setlocal colorcolumn=81
setlocal nocursorline
