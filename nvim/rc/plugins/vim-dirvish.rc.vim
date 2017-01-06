nnoremap <silent> Q :Dirvish<CR>

augroup dirvish_events

  autocmd!

  " If you run with no args, start Dirvish.
  autocmd vimenter * if !argc() | Dirvish | endif

  " Map T to " open in new tab in the background"
  autocmd FileType dirvish
        \  nnoremap <silent><buffer> t :call dirvish#open('tabedit', 1)<CR>
        \ |xnoremap <silent><buffer> t :call dirvish#open('tabedit', 1)<CR>

  " Map t to "open in new tab in the foreground"
  autocmd FileType dirvish
        \  nnoremap <silent><buffer> T :call dirvish#open('tabedit', 0)<CR>
        \ |xnoremap <silent><buffer> T :call dirvish#open('tabedit', 0)<CR>

  " Enable :Gstatus and friends.
  " autocmd FileType dirvish call fugitive#detect(@%)

  " Map `gr` to reload the Dirvish buffer.
  autocmd FileType dirvish nnoremap <silent><buffer> gr :<C-U>Dirvish %<CR>

  " Map `gh` to hide dot-prefixed files.
  " To "toggle" this, just press `R` to reload.
  autocmd FileType dirvish nnoremap <silent><buffer>
        \ gh :silent keeppatterns g@\v/\.[^\/]+/?$@d<cr>

augroup END
