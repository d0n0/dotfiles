<<<<<<< HEAD
if has('mac')
  let g:deoplete#sources#clang#libclang_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
  let g:deoplete#sources#clang#clang_header = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang'
  " let g:deoplete#sources#clang#libclang_path = '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
  " let g:deoplete#sources#clang#clang_header = '/Library/Developer/CommandLineTools/usr/lib/clang'
=======
if has('mac') || ( system('uname -s') == "Darwin\n" )
  let g:deoplete#sources#clang#libclang_path = '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
  let g:deoplete#sources#clang#clang_header = '/Library/Developer/CommandLineTools/usr/lib/clang'
elseif ( !has('mac') && has('unix') ) || ( system('uname -s') == "Linux\n" )
  let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.8/lib/libclang.so.1'
  let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm-3.8/lib/clang'
>>>>>>> 7ca667176a73e66d4ba71715a9238d6ac593d45b
endif
