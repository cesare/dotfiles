"
"
"
set nocompatible
set title
set showmatch
set laststatus=2
set statusline=%y%F%m%r%=<%c:%l>
set number
set cursorline

set exrc

set noeb vb t_vb=
set hidden

set nowrap

set scrolloff=3

"
" Don't create undo files
"
set noundofile

"
" syntactic highlighting
"
syntax on
set hlsearch

"
" enable 256 colors
"
set t_Co=256

"
" cursor shape
"
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
elseif &term =~ "xterm"
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

"
" tab width
"
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set noautoindent
set smartindent

""
"" 空行のインデントを勝手に消さない
""
"nnoremap o oX<C-h>
"nnoremap O OX<C-h>
"inoremap <CR> <CR>X<C-h>

"
" encoding
"
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,euc-jp,shift_jis,iso-2022-jp

set fileformat=unix


filetype off
"call pathogen#runtime_append_all_bundles()



"
" backup files
"
set nobackup
set noswapfile


" neobundle
set nocompatible

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'Keithbsmiley/rspec.vim'
NeoBundle 'thoughtbot/vim-rspec'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'sudo.vim'
NeoBundle 'tfnico/vim-gradle'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Twinside/vim-syntax-haskell-cabal'
NeoBundle 'JuliaLang/julia-vim'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'elmcast/elm-vim'
NeoBundle 'sorah/unite-ghq'

" Color schemes
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'vim-scripts/twilight'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'tomasr/molokai'

"NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim' }
NeoBundle 'itchyny/lightline.vim'

call neobundle#end()

colorscheme jellybeans
let g:lightline = {
  \ 'colorscheme': 'jellybeans',
  \ 'separator': { 'left': '⮀', 'right': '⮂' },
  \ 'component': {
  \   'readonly': '%{&readonly?"⭤":""}',
  \ },
  \ 'subseparator': { 'left': '⮁', 'right': '⮃' },
  \ }

" neocomplete
let g:neocomplete#enable_at_startup = 1


"
" filetypes
"
filetype on
filetype indent on
filetype plugin on

"
" neocomplcache
"
let g:neocomplcache_enable_at_startup = 1


"
" neosnippet
"
let g:neosnippet#snippets_directory = "~/.vim/snippets"

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif


"
" Unite
"
let g:unite_enable_start_insert = 1

nnoremap [unite] <Nop>
nmap <Space>u [unite]

nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]f :<C-u>Unite -buffer-name=file file<CR>
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
"nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
"nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

"
" grep.vim
"
let g:Grep_Xargs_Path = "/usr/local/bin/gxargs"

"
" the platinum searcher
"
nnoremap <silent> ,g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
if executable('pt')
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor'
  let g:unite_source_grep_recursive_opt = ''
endif

"
" vim-over
"
nnoremap <silent> <Leader>m :OverCommandLine<CR>

"
" unite-ghq
"
noremap [unite] <Nop>
map     <Leader>u [unite]

nnoremap <silent>[unite]p :<C-u>Unite file_rec/async<CR>
nnoremap <silent>[unite]g :<C-u>Unite ghq<CR>

"
" JSON
"
autocmd Filetype json setl conceallevel=0
