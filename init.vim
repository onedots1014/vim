let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')
command! -nargs=1 IncScript exec 'so '. fnameescape(s:home."/<args>")
exec 'set rtp+='. fnameescape(s:home)
exec 'set rtp+=~/.vim'

IncScript config/vimconfig.vim
IncScript config/plugin.vim
