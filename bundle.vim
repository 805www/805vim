"----------------------------------------------------------------------
" system detection 
"----------------------------------------------------------------------
let s:uname = asclib#platform#uname()
let g:bundle#uname = s:uname
let g:bundle#windows = (s:uname == 'windows')? 1 : 0


"----------------------------------------------------------------------
" include script
"----------------------------------------------------------------------
let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')

if !exists(':IncScript')
	command! IncScript -nargs=1 exec 'so ' . fnameescape(s:home .'/<args>')
endif

function! bundle#path(path)
	let path = expand(s:home . '/' . a:path )
	return substitute(path, '\\', '/', 'g')
endfunc

function! s:path(path)
	return bundle#path(a:path)
endfunc


"----------------------------------------------------------------------
" packages begin
"----------------------------------------------------------------------
if !exists('g:bundle_group')
	let g:bundle_group = []
endif

let g:bundle_enabled = {}
for key in g:bundle_group | let g:bundle_enabled[key] = 1 | endfor
let s:enabled = g:bundle_enabled


call plug#begin(get(g:, 'bundle_home', '~/.vim/plugged'))

if has_key(s:enabled, 'tag')
	Plug 'skywind3000/vim-gutentags'
	Plug 'skywind3000/gutentags_plus'

	IncScript site/bundle/gutentags.vim
endif

if has_key(s:enabled, 'quickfix')
	Plug 'skywind3000/asyncrun.vim'
	Plug 'skywind3000/asynctasks.vim'

	IncScript site/bundle/asyncrun.vim
	IncScript site/bundle/asynctasks.vim
endif

if has_key(s:enabled, 'ycm')
	IncScript site/bundle/ycm.vim
endif

if has_key(s:enabled, 'leaderf')
	Plug 'Yggdroot/LeaderF'
	IncScript site/bundle/leaderf.vim
endif

if has_key(s:enabled, 'quickui')
	Plug 'skywind3000/vim-quickui'
	IncScript site/bundle/quickui.vim
endif



call plug#end()
