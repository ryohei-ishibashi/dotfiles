let NERDTreeShowHidden = 1
" neovim起動時に自動でNERDTreeを起動する
" autocmd VimEnter * execute 'NERDTree'

" NERDTreeを起動
nnoremap <C-n> :NERDTreeToggle <CR>

" NERD Treeのウィンドウだけが残るような場合にVimを終了したい場合は下記行を追加
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

