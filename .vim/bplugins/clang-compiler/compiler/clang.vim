" vim compiler file
" Compiler:		clang (Apple c compiler)
" Maintainer:   Vincent B. (twinside@free.fr)
" Last Change:  2010 sep 28
if exists("clang")
  finish
endif
let current_compiler = "clang"

let s:cpo_save = &cpo
set cpo-=C

setlocal errorformat=%f:%l:%c:\ %t%s:\ %m

let &cpo = s:cpo_save
unlet s:cpo_save

"vim: ft=vim

