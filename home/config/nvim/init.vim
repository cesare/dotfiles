if &compatible
  set nocompatible
endif

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let s:toml      = '~/.config/nvim/dein.toml'
  let s:lazy_toml = '~/.config/nvim/dein_lazy.toml'

  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

syntax on
colorscheme jellybeans

set number
set termguicolors
set cursorline
set hlsearch

set noundofile
set nobackup
set noswapfile

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set noautoindent
set smartindent

set clipboard+=unnamedplus

filetype on
filetype indent on
filetype plugin on

au BufRead,BufNewFile *.yml.liquid set filetype=yaml
au BufRead,BufNewFile *.dig set filetype=yaml
