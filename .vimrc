set tabstop=4
set shiftwidth=4
set expandtab
set number
set list
set listchars=tab:>.,extends:<,trail:_
set ignorecase
set nobackup
set noswapfile
set noundofile
"set title
set wildmenu
set fenc=utf-8
set enc=utf-8

filetype plugin indent on

syntax enable

augroup RubySetup
  au!
  au BufNewFile,BufRead * set tabstop=4 shiftwidth=4
  au BufNewFile,BufRead *.rhtml set tabstop=2 shiftwidth=2
  au BufNewFile,BufRead *.rb set tabstop=2 shiftwidth=2
  au BufNewFile,BufRead *.yml set tabstop=2 shiftwidth=2
  au BufNewFile,BufRead *.erb set tabstop=2 shiftwidth=2
  au User Rails* set fenc=utf-8
augroup END

" <C-Space> omni func
imap <Nul> <C-x><C-o>

" enable omnifunc
set omnifunc=syntaxcomplete#Complete

" setting for neocomplete
let g:neocomplete#enable_at_startup = 1
" ruby dictionary for neocomplete
" git clone https://github.com/pocke/dicts
let g:neocomplete#sources#dictionary#dictionaries = {
\   'ruby': $HOME . '/dicts/ruby.dict',
\ }

colorscheme murphy

