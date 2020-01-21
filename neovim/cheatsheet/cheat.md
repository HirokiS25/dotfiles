# vim cheetsheat

## basic

`:nmap`で詳細

+ `gg`: ファイルの先頭へ
+ `G`: ファイル末尾
+ `i/I`: 現在位置直前/行頭でインサートモード
+ `a/A`: 現在位置直後/行末でインサートモード
+ `o/O`: 現在行直後/直前で改行してインサートモード
+ `<Leader>y`: copy
+ `<Leader>p`: paste
+ `<Leader>c`: comment out
+ `<Leader>,`: comment out
+ `<Leader>"`: ""で括る
+ `<Leader>'`
+ `<Leader>｀`: ｀｀で括る
> + `<Leader>(`: ()で括る
> + `<Leader>{`: {}で括る
> + `<Leader>[`: []で括る
+ `:%s/<置換前>/<置換後>/g`: %は編集中のファイル全体が対象．:1,100sとすると行指定できる．/gはマッチした単語すべてを置換する

+ `ga`: EasyAlignを起動する．コマンドラインで`*,`とするとカンマで区切られたすべての要素に対して整形を行う．
+ `<visual><Shift-s><()>`: ビジュアルモードで選択した部分を括弧でくくる．

## Quickfix
+ `:ccl`: quickfixのウィンドウを閉じる
+ `:cope`: quickfixのウィンドウを開く
+ `lcl`: localウィンドウを閉じる
+ `lop`: localウィンドウを開く
+ `:cw[indow]`: 認識されたエラーがあるときquickfixウィンドウを開く

## buffer
+ `<C-h>`: previous buffer
+ `<C-k>`: next buffer

## python

## markdown
+ `:TableModeToggle`: vim-table-mode
+ `:PrevimOpen`: view by browser

## LaTeX

- `<Space>ll`: 自動コンパイル
- `<Space>lv`: ビューアを開く
- `<Space>lc`: latexmk -c

## html/css

## javascript
