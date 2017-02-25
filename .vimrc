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

"------------------------
" setting for neocomplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
"let g:neocomplete#sources#syntax#min_keyword_length = 3
" Define dictionary.
" for ruby: git clone https://github.com/pocke/dicts
let g:neocomplete#sources#dictionary#dictionaries = {
\   'default' : '',
\   'ruby': $HOME . '/dicts/ruby.dict',
\ }
"\ 'vimshell' : $HOME.'/.vimshell_hist',

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby,ruby setlocal omnifunc=rubycomplete#Complete

"------------------------
" setting for endwise
"let g:endwise_no_mappings=1

"------------------------
colorscheme murphy

