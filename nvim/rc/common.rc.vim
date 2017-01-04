" load dein.rc.vim
source ~/dotfiles/nvim/rc/plugins/dein.rc.vim
" -----------------------------------------------------


" font
" set guifont=CicaE-Regular:h18

" colorscheme
if (has("termguicolors"))
  set termguicolors
endif
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme onedark

" 不可視文字表示
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

" :sp/:vspの表示位置
set splitright
set splitbelow

set number          " 行番号

set ruler           " カーソル位置表示

set cursorline      " 列を強調表示

set cursorcolumn    " 行を表示

set incsearch       " インクリメンタル検索

set hlsearch        " 検索結果ハイライト

set nowrap          " 行の折り返し

set showmatch       " 対応する括弧に色付け

set whichwrap=h,l   " 行頭(末)で行を跨いで移動する

set ignorecase      " 検索で大文字小文字を区別しない

set smartcase       " 検索結果が大文字を含んでいたらignorecaseを上書き

set hidden          " 保存されてないファイルが有るときでも他のファイルを開く

set history=2000    " コマンド入力履歴保持数

set title           " タイトル表示

set noshowmode      " lightline.vimを使うため、モード非表示



"  インデント関連設定
set autoindent      " 改行時に前の行のインデントを計測
set smartindent     " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smarttab        " 新しい行を作った時に高度な自動インデントを行う

set shiftwidth=2    " 自動インデントで入る空白数(sw)
set softtabstop=2   " キーボードから入るタブの数(sts)
set tabstop=2       " タブを含むファイルを開いた際、タブを何文字の空白に変換するか(ts)
set expandtab       " タブ入力を複数の空白に置き換える(et)

" ファイルタイプ固有設定
autocmd FileType c           setlocal sw=4 sts=4 ts=4 et
autocmd FileType javascript  setlocal sw=2 sts=2 ts=2 et
autocmd FileType zsh         setlocal sw=2 sts=2 ts=2 et
autocmd FileType html        setlocal sw=2 sts=2 ts=2 et

inoremap <silent> jj <esc> 