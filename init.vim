let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')
command! -nargs=1 IncScript exec 'so '. fnameescape(s:home."/<args>")
exec 'set rtp+='. fnameescape(s:home)
exec 'set rtp+=~/.vim'

set ffs=unix,dos,mac

IncScript init/viminit.vim
IncScript init/config.vim
IncScript init/gui.vim
IncScript init/keymaps.vim
IncScript init/ignores.vim


