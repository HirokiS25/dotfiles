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
	let g:rc_dir = expand('~/.config/nvim/rc')
	let s:toml = g:rc_dir . '/dein.toml'
	let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

	call dein#load_toml(s:toml, {'lazy': 0})
	call dein#load_toml(s:lazy_toml, {'lazy': 1})

	call dein#end()
	call dein#save_state()
endif

if dein#check_install()
	call dein#install()
endif

filetype plugin indent on
syntax enable

" autocmd bufenter * Defx -split=vertical -winwidth=10 -direction=topleft
" augroup vimrc_loading
"     autocmd!
"     autocmd BufNewFile * put = 'vimvim'
" augroup END

" ---------------------------
" settings
" ---------------------------
set encoding=UTF-8
set guifont=DroidSansMono\ Nerd\ Font\ 11
" repalce <Leader>
let maplocalleader = "\<Space>"
let mapleader = "\<Space>"

" let g:netrw_banner = 0
" let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
" let g:netrw_winsize = 25
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END
" ファイルツリーの表示形式、1にするとls -laのような表示になります
" 3でツリー表示にする
" let g:netrw_liststyle=3
" ヘッダを非表示にする
" let g:netrw_banner=0
" サイズを(K,M,G)で表示する
" let g:netrw_sizestyle="H"
" 日付フォーマットを yyyy/mm/dd(曜日) hh:mm:ss で表示する
" let g:netrw_timefmt="%Y/%m/%d(%a) %H:%M:%S"
" プレビューウィンドウを垂直分割で表示する
" let g:netrw_preview=1
" 'v'でファイルを開くときは右側に開く。(デフォルトが左側なので入れ替え)
" let g:netrw_altv = 1
" 'o'でファイルを開くときは下側に開く。(デフォルトが上側なので入れ替え)
" let g:netrw_alto = 1
" 分割で開いたときに85%のサイズで開く
" let g:netrw_winsize = 85

" display setting
set title
set list
set number
set tabstop=4
set shiftwidth=4
set showbreak=↪

set cursorline
hi clear CursorLine
hi LineNr ctermbg=0 ctermfg=1
hi CursorLineNr ctermbg=0 ctermfg=2

" search
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
" 小文字の検索でも大文字も見つかるようにする
set ignorecase
" ただし大文字も含めた検索の場合はその通りに検索する
set smartcase
" インクリメンタルサーチを行う
set incsearch

set matchpairs& matchpairs+=<:>
" set termguicolors
" colorscheme iceberg

" clipboard
" クリップボードをデフォルトのレジスタとして指定。後にYankRingを使うので
" 'unnamedplus'が存在しているかどうかで設定を分ける必要がある
if has('unnamedplus')
    " set clipboard& clipboard+=unnamedplus " 2013-07-03 14:30 unnamed 追加
    set clipboard& clipboard+=unnamedplus,unnamed 
else
    " set clipboard& clipboard+=unnamed,autoselect 2013-06-24 10:00 autoselect 削除
    set clipboard& clipboard+=unnamed
endif

" buffer setting
set hidden

" swap file
" *.swpの出力を変更
set directory=~/.config/nvim/swaps


" ---------------------------
" # key-mapping
" ---------------------------

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
" nnoremap <silent> <C-h> :bprev<CR>
" nnoremap <silent> <C-l> :bnext<CR>

" Ctrl + hjkl でウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

noremap j gj
noremap k gk

inoremap <silent> jj <ESC>

" 検索語が画面の真ん中に来るようにする
nmap n nzz 
nmap N Nzz 
nmap * *zz 
nmap # #zz 
nmap g* g*zz 
nmap g# g#zz

" ---------------------------
" # TODO
" ---------------------------

" " 単語を囲む
" nnoremap <Leader>" ciw""<Esc>P
" nnoremap <Leader>' ciw''<Esc>P
" nnoremap <Leader>` ciw``<Esc>P
" nnoremap <Leader>( ciw()<Esc>P
" nnoremap <Leader>{ ciw{}<Esc>P
" nnoremap <Leader>[ ciw[]<Esc>P



" 背景の透過
augroup TransparentBG
	autocmd!
	autocmd Colorscheme * highlight Normal ctermbg=none
	autocmd Colorscheme * highlight NonText ctermbg=none
	autocmd Colorscheme * highlight LineNr ctermbg=none
	autocmd Colorscheme * highlight Folded ctermbg=none
	autocmd Colorscheme * highlight EndOfBuffer ctermbg=none
augroup END


" Quickfix



" Plugin key-mappings.
" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"



"set snippet file dir
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/snippets/,~/.vim/snippets'




" treeを表示する
" let NERDTreeShowHidden = 1
" nnoremap <silent><C-e> :NERDTreeFocusToggle<CR>
" let g:nerdtree_tabs_open_on_console_startup = 1
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif




"" quickrun
" nnoremap <Leader>go :QuickRun<CR>
" let g:quickrun_config={'*': {'split': ''}}

"" syntastic
" let g:syntastic_always_populate_loc_list=1
" let g:syntastic_error_symbol='✗'
" let g:syntastic_warning_symbol='⚠'
" let g:syntastic_style_error_symbol = '✗'
" let g:syntastic_style_warning_symbol = '⚠'
" let g:syntastic_auto_loc_list=1
" let g:syntastic_aggregate_errors = 1



