# .vimrcの設定ファイルを読み込む
if filereadable(expand('~/.vimrc'))
  source ~/.vimrc
endif

" ===========================以下neovim設定=================================
if has('nvim')
  " 参考記事
  " https://qiita.com/tamago3keran/items/cdfd66b627b3686846d2
  if &compatible
    set nocompatible
  endif
  set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
  if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')
    call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
    call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})
    call dein#end()
    call dein#save_state()
  endif
  " プラグインのインストールを自動化
  if dein#check_install()
    call dein#install()
  endif
  filetype plugin indent on
  syntax enable

  " terminalモード関連の設定をマップするファイルの読み込み＆terminalモード関連設定
  if filereadable(expand('~/.config/nvim/settings/terminal_settings.vim'))
    source ~/.config/nvim/settings/terminal_settings.vim
  endif
  " ターミナルモードで行番号を非表示
  autocmd TermOpen * setlocal norelativenumber
  autocmd TermOpen * setlocal nonumber
  " ターミナルを開いたらに常にinsertモードに入る
  autocmd TermOpen * :startinsert

endif

