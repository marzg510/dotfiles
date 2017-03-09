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

" setting statusline
" ファイル名表示
set statusline=%F
" 変更チェック表示
set statusline+=%m
" 読み込み専用かどうか表示
set statusline+=%r
" ヘルプページなら[HELP]と表示
set statusline+=%h
" プレビューウインドウなら[Prevew]と表示
set statusline+=%w
" これ以降は右寄せ表示
set statusline+=%=
" file encoding
set statusline+=[%{&fileencoding}]
" 現在行数/全行数/percentage
set statusline+=[%l/%L(%p%%)]
" display git branch
try
"    set s:str=%{fugitive#statusline()}
"    set statusline+=%{s:str}
    set statusline+=%{fugitive#statusline()}
catch
endtry
" always display statusline
set laststatus=2

filetype plugin indent on

syntax enable

" 全角スペースを可視化
if has('syntax')
  syntax enable
  function! ActivateInvisibleIndicator()
    highlight ZenkakuSpace cterm=underline ctermfg=Blue gui=underline guifg=Blue
    match ZenkakuSpace /　/
  endfunction
  augroup InvisibleIndicator
    autocmd!
    autocmd BufEnter * call ActivateInvisibleIndicator()
  augroup END
endif

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
"colorscheme murphy
colorscheme elflord

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
" setting for neosnippet
" snipet directory
let g:neosnippet#snippets_directory = '~/.vim/pack/mypack/start/neosnippet-snippets/neosnippets/'
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"------------------------
" setting for vim-ref
let g:ref_open                    = 'split'
let g:ref_refe_cmd                = $HOME.'/.rbenv/shims/refe'

"------------------------
" setting for vim-fugitive
nnoremap <silent> <Space>gb :Gblame<CR>
nnoremap <silent> <Space>gd :Gdiff<CR>
nnoremap <silent> <Space>gs :Gstatus<CR>

