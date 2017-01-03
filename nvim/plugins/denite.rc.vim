" file_rec
if executable('ag')
  call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', ''])
endif

" grep
if executable('ag')
  call denite#custom#var('grep', 'command', ['ag', '--nogroup', '--nocolor', '--smart-case', '--hidden'])
  call denite#custom#var('grep', 'default_opts', [])
  call denite#custom#var('grep', 'recursive_opts', [])
endif

call denite#custom#source('file_mru', 'matchers', ['matcher_fuzzy', 'matcher_project_files'])
call denite#custom#source('file_mru', 'converters', ['converter_relative_word'])
