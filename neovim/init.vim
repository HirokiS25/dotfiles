if &compatible
	set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
	call dein#begin('~/.cache/dein')

	call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
	call dein#add('Shougo/vimproc.vim', {'build':'make'})
	call dein#add('Shougo/deoplete.nvim')
	if !has('nvim')
		call dein#add('roxma/nvim-yarp')
		call dein#add('roxma/vim-hug-neovim-rpc')
	endif

	" plugins loading from .toml
	" let g:rc_dir = expand('~/.config/nvim/rc')
	let g:rc_dir = expand('~/dotfiles/neovim/rc')
	let s:toml = g:rc_dir . '/dein.toml'
	let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
	let s:layout = g:rc_dir . '/layout.toml'

	call dein#load_toml(s:toml, {'lazy': 0})
	call dein#load_toml(s:lazy_toml, {'lazy': 1})
	call dein#load_toml(s:layout, {'lazy': 0})

	call dein#end()
	call dein#save_state()
endif

if dein#check_install()
	call dein#install()
endif

filetype plugin indent on
syntax enable


" ========================================
" SETTING
" ========================================
set encoding=UTF-8
set guifont=DroidSansMono\ Nerd\ Font\ 11
" repalce <Leader>
let maplocalleader = "\<Space>"
let mapleader = "\<Space>"
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

" ------------------
" DISPLAY
" ------------------
set title
set list
set number
set tabstop=4
set shiftwidth=4
set showbreak=↪
set termguicolors
set pumblend=10
colorscheme iceberg

set cursorline
" hi clear CursorLine
" hi LineNr ctermbg=0 ctermfg=1
" hi CursorLineNr ctermbg=234 ctermfg=2

" カーソルの左右移動で行末から次の行の行頭への移動が可能になる
set whichwrap=b,s,h,l,<,>,[,],~

" ------------------
" SEARCH
" ------------------
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
" 小文字の検索でも大文字も見つかるようにする
set ignorecase
" ただし大文字も含めた検索の場合はその通りに検索する
set smartcase
" インクリメンタルサーチを行う
set incsearch
" 検索結果をハイライト
set hlsearch

set matchpairs& matchpairs+=<:>

" ------------------
" CLIPBOARD
" ------------------
" クリップボードをデフォルトのレジスタとして指定。後にYankRingを使うので
" 'unnamedplus'が存在しているかどうかで設定を分ける必要がある
if has('unnamedplus')
    " set clipboard& clipboard+=unnamedplus " 2013-07-03 14:30 unnamed 追加
    set clipboard& clipboard+=unnamedplus,unnamed 
else
    " set clipboard& clipboard+=unnamed,autoselect 2013-06-24 10:00 autoselect 削除
    set clipboard& clipboard+=unnamed
endif

" ------------------
" BUFFER
" ------------------
set hidden

" ------------------
" BACKUP
" ------------------
" *.swpの出力を変更
set directory=~/.config/nvim/swaps


" ========================================
" # KEY-MAPPING
" ========================================

" https://postd.cc/how-to-boost-your-vim-productivity/
nnoremap <Leader>w :w<CR>
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
nmap <Leader><Leader> V

nnoremap <ESC><ESC> :noh<CR>

" bufdo tab split
" nnoremap <silent><C-p> :bprev<CR>
" nnoremap <silent><C-n> :bnext<CR>

" Ctrl + hjkl でウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" 折り返し部分も移動する
noremap j gj
noremap k gk

" インサートモードのときjjでエスケープする
inoremap <silent> jj <ESC>

" 検索語が画面の真ん中に来るようにする
nmap n nzz 
nmap N Nzz 
nmap * *zz 
nmap # #zz 
nmap g* g*zz 
nmap g# g#zz

