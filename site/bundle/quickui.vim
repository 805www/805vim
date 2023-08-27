" ---------------------------------------------------------
"  color
" ---------------------------------------------------------

let g:quickui_border_style = 3
let g:quickui_color_scheme = 'borland'
let g:quickui_preview_w = 100
let g:quickui_preview_h = 23

" ---------------------------------------------------------
"  switch buffer
" ---------------------------------------------------------

if has('patch-8.2.1') || has('nvim-0.4')
	nnoremap <silent>+ :call quickui#tools#list_buffer('FileSwitch')<cr>
else
	nnoremap + :call bufferhint#Popup()<CR>
endif

" ---------------------------------------------------------
"  preview quickfix
" ---------------------------------------------------------

if has('autocmd')
	function! s:quickfix_keymap()
		if &buftype != 'quickfix'
			return
		endif
		nnoremap <silent><buffer> p :call quickui#tools#preview_quickfix()<cr>
		nnoremap <silent><buffer> P :PreviewClose<cr>
		nnoremap <silent><buffer> q :close<cr>
		setlocal nonumber
	endfunc
	function! s:insert_leave()
		if get(g:, 'echodoc#enable_at_startup') == 0
			set showmode
		endif
	endfunc
	augroup AscKeymapsAu
		autocmd!
		autocmd FileType qf call s:quickfix_keymap()
		autocmd FileType vim noremap <buffer><F4> :<c-u>silent update<cr>:so %<cr>
		autocmd FileType python noremap <buffer><F4> :<c-u>silent update<cr>:call asclib#python#refresh('%')<cr>
		autocmd InsertLeave * call s:insert_leave()
		" autocmd InsertLeave * set showmode
	augroup END
endif

nnoremap <silent><m-a> :PreviewSignature<cr>
inoremap <silent><m-a> <c-\><c-o>:PreviewSignature<cr>

