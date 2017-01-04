" OS 振り分け
"
if has('mac') || ( system('uname -s') == "Darwin\n" )
  source ~/dotfiles/nvim/rc/macos.rc.vim
elseif ( !has('mac') && has('unix') ) || ( system('uname -s') == "Linux\n" )
  source ~/dotfiles/nvim/rc/linux.rc.vim
elseif has('win32') || has('win64')
  source ~/dotfiles/nvim/rc/common.rc.vim
endif
" --------------------------------------------
