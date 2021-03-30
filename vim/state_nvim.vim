if g:dein#_cache_version !=# 150 || g:dein#_init_runtimepath !=# '/Users/usr/dotfiles/vim/repos/github.com/Shougo/dein.vim,/Users/usr/.config/nvim,/etc/xdg/nvim,/Users/usr/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/usr/local/Cellar/neovim/0.4.4_1/share/nvim/runtime,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/Users/usr/.local/share/nvim/site/after,/etc/xdg/nvim/after,/Users/usr/.config/nvim/after' | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/Users/usr/.config/nvim/init.vim', '/Users/usr/dotfiles/vim/rc/dein.toml', '/Users/usr/dotfiles/vim/rc/dein_lazy.toml'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Users/usr/dotfiles/vim'
let g:dein#_runtime_path = '/Users/usr/dotfiles/vim/.cache/init.vim/.dein'
let g:dein#_cache_path = '/Users/usr/dotfiles/vim/.cache/init.vim'
let &runtimepath = '/Users/usr/dotfiles/vim/repos/github.com/Shougo/dein.vim,/Users/usr/.config/nvim,/etc/xdg/nvim,/Users/usr/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/Users/usr/dotfiles/vim/repos/github.com/junegunn/fzf,/Users/usr/dotfiles/vim/repos/github.com/neoclide/coc.nvim_release,/Users/usr/dotfiles/vim/.cache/init.vim/.dein,/usr/local/Cellar/neovim/0.4.4_1/share/nvim/runtime,/Users/usr/dotfiles/vim/.cache/init.vim/.dein/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/Users/usr/.local/share/nvim/site/after,/etc/xdg/nvim/after,/Users/usr/.config/nvim/after'
filetype off
	noremap <C-,> gcc
	vmap <C-a> gcc<ESC>
  fun! FzfOmniFiles()
    let is_git = system('git status')
    if v:shell_error
      :Files
    else
      :GitFiles
    endif
  endfun
  nnoremap <C-b> :Buffers<CR>
  nnoremap <C-g> :Rg<Space>
  nnoremap <leader><leader> :Commands<CR>
  nnoremap <C-p> :call FzfOmniFiles()<CR>
colorscheme elly
  let g:rainbow#max_level = 16
  let g:rainbow#pairs = [['(', ')'], ['[', ']']]
  " List of colors that you do not want. ANSI code or #RRGGBB
  let g:rainbow#blacklist = [233, 234]
