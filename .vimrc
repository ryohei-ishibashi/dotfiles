if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
    set fileencodings=ucs-bom,utf-8,latin1 "文字コードの指定
endif

" エンコーディング
set termencoding=utf-8            " ターミナルで使われるエンコーディング
set encoding=utf-8                " デフォルトエンコーディング
set fileencoding=utf-8            " デフォルトのファイルエンコーディング
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp-2,euc-jisx0213,euc-jp,cp932 " vimが表示できるエンコードのリスト

" ステータスライン設定
set laststatus=2  " 常にステータスラインを表示
set cmdheight=2  " コマンドラインで利用する行数
set statusline=[%L]\ %t\ %y%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%r%m%=%c:%l/%L

set autoread                    " 他で書き換えられたら自動で再読み込み
set hidden                      " 編集中でもほかのファイルを開けるようにする

" display
syntax on " シンタックスをハイライト
set title                       " ウィンドウのタイトルを変更する
set scrolloff=5                 " スクロール時の余白確保
set vb t_vb=                    " ビープを鳴らさない
set showcmd                     " コマンドをステータス行に表示
set showmatch                   " 括弧の対応をハイライト
set number                      " 行番号表示
set display=uhex                " 印字不可能文字を16進数で表示
set noruler                     " ルーラーを表示しない
set formatoptions+=mM           " テキスト挿入中の自動折り返しを日本語に対応
set shellslash                  " ディレクトリの区切り文字に/指定
set ambiwidth=double            " 特殊文字対応
set cursorline " 現在の行を強調表示

" タブ&インデント
set expandtab " タブの代わりに空白文字を挿入する
set tabstop=4 " タブ文字の表示幅
set shiftwidth=4 " Vimが挿入するインデントの幅
set smarttab " 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する


colorscheme jellybeans " デフォルトのカラースキーマ

" 検索
set ignorecase " 検索するときに大文字小文字を区別しない
set smartcase " 小文字で検索すると大文字と小文字を無視して検索
set wrapscan " 検索がファイル末尾まで進んだら、ファイル先頭から再び検索
set incsearch " インクリメンタル検索 (検索ワードの最初の文字を入力した時点で検索が開始)
set hlsearch " 検索結果をハイライト表示
set grepprg=git\ grep\ -n\ $*       " grepにgit grepを使用する

" backup
set nobackup " バックアップ無効
set nowritebackup " ファイルを上書きする前にバックアップを作ることを無効化

" menu / complation
set wildmenu            " コマンド補完メニューを表示
set wildmode=full       " 複数のマッチがあるときは全てのマッチを表示し、共通する最長の文字列まで補完
set history=1000        " コマンドの履歴数
set complete+=k         " 補完に辞書ファイル追加

" その他
" 他で書き換えられたら自動で読み直す
set autoread
" スワップファイルを生成しない
set noswapfile
" 入力中のコマンドを表示する
set showcmd
" コマンドモードでTabキーによるファイル名を補完する
set wildmenu

set modifiable
set write

" 行単位で移動
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" カーソル下の単語をハイライト
nnoremap <silent> <Space><Space> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>
"ハイライトを削除
nnoremap <silent> <Esc><Esc><Esc> :<C-u>nohlsearch<CR>

"x、s、pでヤンクしない
nnoremap x "_x
nnoremap s "_s
xnoremap p "_dP

nnoremap * *N

" 前のタブへの移動
nnoremap gr gT

" ビジュアルモード時vで単語移動
vnoremap v w

" emacs like key
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" 日付入力
inoremap <expr> ,df strftime("%Y-%m-%dT%H:%M:%S")
inoremap <expr> ,dd strftime("%Y-%m-%d")

" filetype ----------------------------------------------------------
filetype on
filetype indent on  " ファイルタイプによるインデント設定
filetype plugin on  " ファイルタイプごとのプラグイン読み込み

" ruby
autocmd FileType ruby,eruby setlocal tabstop=2 shiftwidth=2
autocmd FileType ruby,eruby setlocal makeprg=ruby\ -c\ %
autocmd FileType ruby,eruby setlocal errorformat=%m\ in\ %f\ on\ line\ %l
autocmd FileType ruby,eruby setlocal formatoptions-=r " 挿入モードで改行したときにコメントを自動挿入しない
autocmd FileType ruby,eruby setlocal formatoptions-=o " ノーマルモードでoしたときにコメントを自動挿入しない

" changelog
autocmd BufNew,BufRead *.changelog set filetype=changelog
let g:changelog_timeformat="%Y-%m-%d"
let g:changelog_username="mostlyfine@gmail.com"

" action script
autocmd BufNewFile,BufRead *.as set filetype=actionscript
autocmd FileType actionscript setlocal dictionary=d:/vim/runtime/dict/actionscript3.dict

" java
autocmd FileType java setlocal dictionary=d:/vim/runtime/dict/j2se14.dict

" git
autocmd BufNewFile,BufRead COMMIT_EDITMSG set filetype=git

" php
let php_sql_query=1
let php_htmlInStrings=1
let php_noShortTags=1
let php_folding=0
autocmd BufNewFile,BufRead *.thml set filetype=html
autocmd BufNewFile,BufRead *.ctp set filetype=html
autocmd BufNewFile,BufRead *.tpl set filetype=html
autocmd FileType php setlocal makeprg=php\ -l\ %
autocmd FileType php setlocal errorformat=%m\ in\ %f\ on\ line\ %l
autocmd FileType php setlocal dictionary=d:/vim/runtime/dict/php.dict
" インデントタブ(スペース4つ設定)
autocmd FileType php setlocal noexpandtab list listchars=tab:^\  shiftwidth=4 tabstop=4
" スペース4つ設定
" autocmd FileType php setlocal shiftwidth=4 tabstop=4

function PHPLint()
    let result = system( &ft . ' -l ' . bufname(""))
    echo result
endfunction

autocmd FileType php  :nmap ,l :call PHPLint()<CR>

" smarty
autocmd FileType smarty setlocal noexpandtab list listchars=tab:^\  shiftwidth=4 tabstop=4

" cucumber
autocmd BufNewFile,BufRead *.feature set filetype=ruby

" yaml
autocmd FileType yaml setlocal shiftwidth=4 tabstop=4

" other -------------------------------------------------------------

" 挿入モード時ステータスラインの色を変える
autocmd InsertEnter * highlight StatusLine ctermbg=red guibg=red
autocmd InsertLeave * highlight StatusLine ctermbg=darkgray guibg=darkgray

" 自動的にQuickFixリストを表示する
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep,vimgrepadd cwin

" 全角/行末スペースを表示
scriptencoding utf-8
highlight IgnoreSpace ctermbg=red guibg=red
autocmd Colorscheme * highlight IgnoreSpace ctermbg=red guibg=red
autocmd VimEnter,WinEnter * match IgnoreSpace /\s\+$\|　/
autocmd BufWritePre,FileWritePre * :%s/\s\+$\|^　\|　$//ge

