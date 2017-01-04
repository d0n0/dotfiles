let g:tmuxline_preset = {
      \ 'a'    : '#S',
      \ 'b'    : '#(cat ~/dotfiles/tmux/scripts/tmp/pwd.tmp)',
      \ 'c'    : '',
      \ 'win'  : '#I #W',
      \ 'cwin' : '#I #W',
      \ 'x'    : '%Y-%m-%d(%a) %R#(display_period.sh)',
      \ 'y'    : '#(whoami)',
      \ 'z'    : '#h'
      \ }
