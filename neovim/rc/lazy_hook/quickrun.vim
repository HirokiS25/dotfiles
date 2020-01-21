
"" key-mapping
nnoremap <Space>run :QuickRun<CR>

let g:quickrun_config = get(g:, 'quickrun_config', {})

"" quickrunのランナーにvimprocを使用する
"" 成功時はバッファへ
"" エラー時はquickfixへ出力
let g:quickrun_config._ = {
\   'runner'    : 'vimproc',
\   'runner/vimproc/updatetime' : 60,
\   'outputter' : 'error',
\   'outputter/error/success' : 'buffer',
\   'outputter/error/error'   : 'quickfix',
\   'outputter/buffer/split'  : ':rightbelow 8sp',
\   'outputter/buffer/close_on_empty' : 1,
\}

"" quickrunでlatexmkする
let g:quickrun_config = {
\    'tex': {
\        'command': 'latexmk',
\        'exec': ['%c -gg -pdf %s', 'xdg-open %s:r.pdf']
\    },
\}
