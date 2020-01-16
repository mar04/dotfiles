source ~/.config/nvim/ftplugin/common_local.vim
" let c_space_errors=1
nmap <buffer> K <leader>K
nmap <buffer> <Space>= :pyf ~/bin/clang-format.py<CR>
" imap <C-I> <ESC>:pyf ~/bin/clang-format.py<CR>i
setlocal cursorline
setlocal foldmethod=syntax
setlocal foldnestmax=1
setlocal formatprg=clang-format
setlocal number
setlocal colorcolumn=80
