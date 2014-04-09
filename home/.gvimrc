set columns=225
set lines=76
set number
winpos 80 0

set guicursor=a:blinkon0
set transparency=10

set vb t_vb=

set cursorline

" hide toolbar
set guioptions-=T

"
" disable scrollbars
"
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=b

" disable mouse
set mouse=

" enable clipboard
set clipboard=unnamed

"colorscheme desert
"colorscheme wombat
"colorscheme hybrid
colorscheme jellybeans

if has('multi_byte_ime') || has('xim') || has('mac') || has('gui_macvim')
  highlight Cursor guifg=NONE guibg=Red
  " IME ON時のカーソルの色を設定(設定例:紫)
  highlight CursorIM guibg=Purple guifg=NONE
  " 挿入モード・検索モードでのデフォルトのIME状態設定
  set noimdisable
  set iminsert=0 imsearch=0
  if has('xim') && has('GUI_GTK')
    " XIMの入力開始キーを設定:
    " 下記の s-space はShift+Spaceの意味でkinput2+canna用設定
    "set imactivatekey=s-space
  endif
  " 挿入モードでのIME状態を記憶させない場合、次行のコメントを解除
  "inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif

" omni-completion with ^SPC
imap <C-Space> <C-x><C-o>

augroup hack234
  autocmd!
  if has('mac')
    autocmd FocusGained * set transparency=10
    autocmd FocusLost * set transparency=20
  endif
augroup END
