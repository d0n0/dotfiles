if has('mac') || ( system('uname -s') == "Darwin\n" )
  let g:deoplete#sources#clang#libclang_path = '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
  let g:deoplete#sources#clang#clang_header = '/Library/Developer/CommandLineTools/usr/lib/clang'
elseif ( !has('mac') && has('unix') ) || ( system('uname -s') == "Linux\n" )
  let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.8/lib/libclang.so.1'
  let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm-3.8/lib/clang'
endif
