au FileType go nmap <leader>r <Plug>(go-run-split)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

au FileType go :highlight goErr cterm=bold ctermfg=214
au FileType go :match goErr /\<err\>/

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

let g:go_fmt_command = "goimports"
let s:goargs = go#package#ImportPath(expand('%:p:h'))

let g:neomake_go_errcheck_maker = {
      \ 'args': ['-abspath', s:goargs],
      \ 'append_file': 0,
      \ 'errorformat': '%f:%l:%c:\ %m, %f:%l:%c\ %#%m',
      \ }

let g:neomake_go_enabled_makers = ['golint', 'govet', 'errcheck']
let g:go_list_type = "quickfix"
