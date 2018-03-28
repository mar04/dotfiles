let javaScript_fold=1
let tern_show_signature_in_pum=1
" let tern_show_argument_hints='on_hold'
nmap <buffer> K :TernDocBrowse<CR>
nmap <buffer> gt :TernType<CR>
nmap <buffer> gd :TernDef<CR>
nmap <buffer> <Space>gd :TernDefPreview<CR>
nmap <buffer> <Space>gr :TernRename<CR>
nmap <buffer> <Space>gR :TernRefs<CR>
setlocal number
setlocal colorcolumn=81
