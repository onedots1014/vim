let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')
command! -nargs=1 IncScript exec 'so '. fnameescape(s:home."/<args>")
exec 'set rtp+='. fnameescape(s:home)

" Platform detection
let g:is_nvim = has('nvim')
let g:is_win = has('win32') || has('win64')
let g:vim_home = s:home

if !g:is_nvim
    exec 'set rtp+=' . expand('~/.vim')
endif

IncScript config/vimconfig.vim
IncScript config/plugin.vim
IncScript config/keymap.vim
