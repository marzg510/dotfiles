set tabstop=2
set shiftwidth=2
set expandtab
set number
set list
set listchars=tab:>-,extends:<,trail:_
set ignorecase
set nobackup
set noswapfile
set noundofile
set hidden
set wildmenu
set ambiwidth=double
set autochdir
set virtualedit=onemore
set autoindent
set smartindent

" for font setting
set enc=utf-8
" Use "/" for Directory Separater with Ctrl-X + Ctrl-F
set shellslash

" setting statusline
set laststatus=2            " always display statusline
set statusline=[%{winnr()}] " window番号
set statusline+=%F          " ファイル名表示
set statusline+=%y          " filetype
set statusline+=%m          " 変更チェック表示
set statusline+=%r          " 読み込み専用かどうか表示
set statusline+=%h          " ヘルプページなら[HELP]と表示
set statusline+=%w          " プレビューウインドウなら[Prevew]と表示
set statusline+=%=          " これ以降は右寄せ表示
set statusline+=[%{&fileformat}:%{&fileencoding}] " file encoding & file format
set statusline+=[%l/%L(%p%%)] " 現在行数/全行数/percentage
set showcmd
" display git branch
let g:setted_fugitive_statusline=0
augroup SetFugitiveStatusLine
    function! SetFugitiveStatusLine()
        if !get(g:,'setted_fugitive_statusline') && get(g:,'loaded_fugitive')
            set statusline+=%{fugitive#statusline()}
            let g:setted_fugitive_statusline=1
        endif
    endfunction
    au!
    au BufNewFile,bufread,bufwrite * call SetFugitiveStatusLine()
augroup END

" Windows key bind(Ctrl-C)
source $VIMRUNTIME/mswin.vim
silent! unmap  <expr> <C-F>
silent! iunmap <silent> <expr> <C-F>
silent! cunmap <silent> <expr> <C-F>

" IME AUTO OFF
if has('unix')
  function! ImInActivate()
    call system('fcitx-remote -c')
  endfunction
  inoremap <silent> <C-[> <ESC>:call ImInActivate()<CR>
endif

filetype plugin indent on

syntax enable

" Visible W-byte space
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

" disable markdown syntax conceal
let g:markdown_syntax_conceal=0

augroup RubySetup
  au!
"  au BufNewFile,BufRead *.rhtml setlocal tabstop=2 shiftwidth=2
"  au BufNewFile,BufRead *.rb setlocal tabstop=2 shiftwidth=2
"  au BufNewFile,BufRead *.yml setlocal tabstop=2 shiftwidth=2
"  au BufNewFile,BufRead *.erb setlocal tabstop=2 shiftwidth=2
  au User Rails* setlocal fenc=utf-8
  au FileType ruby,eruby setlocal fileformat=unix tabstop=2 shiftwidth=2
augroup END

augroup FileTypeIndent
  au!
"  au FileType sql setlocal tabstop=2 shiftwidth=2 expandtab
  au FileType java setlocal tabstop=4 shiftwidth=4 expandtab
  au FileType python setlocal tabstop=4 shiftwidth=4 expandtab
  au FileType vim setlocal fileformat=unix tabstop=2 shiftwidth=2
  au FileType sh setlocal fileformat=unix tabstop=2 shiftwidth=2
augroup END

" enable omnifunc
set omnifunc=syntaxcomplete#Complete
" <C-Space> omni func
imap <Nul> <C-x><C-o>
if has('win32') || has('win64')
    imap <C-Space> <C-x><C-o>
endif

" disable auto window resize
"set noequalalways

" new window below
"set splitbelow
" new window right
"set splitright

"------------------------
" setting for netrw
" set default view = tree
let g:netrw_liststyle = 1
" 'v' open in right windows (default is left)
let g:netrw_altv = 1
" set hide pattern
let g:netrw_list_hide = "\\(^\\|\\s\\s\\)\\zs\\.\\S\\+"

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
autocmd FileType python setlocal omnifunc=python3complete#Complete
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
nnoremap <silent> <Space>gp :Gpush<CR>

"------------------------
" setting for memolist
nnoremap <Space>mn  :new<CR>:MemoNew<CR>
nnoremap <Space>mnt  :new<CR>:MemoNew<CR>work-memo<CR>
nnoremap <Space>mnw  :MemoList<CR>G<C-M>
nnoremap <Space>ml  :MemoList<CR>
nnoremap <Space>mg  :MemoGrep<CR>
let g:memolist_memo_suffix = "md"

"------------------------
" setting for QFixHowm
let QFixHowm_Key = '<Space>'
"新規エントリのテンプレート
let QFixHowm_Template = [
  \"= %TAG%",
  \""
\]
let QFixHowm_FileType = 'markdown'

"------------------------
" setting for Quickrun
nnoremap <Space>qr :QuickRun<CR>
nnoremap <Space>qra :QuickRun -args "
let g:quickrun_config={
    \'_': {
        \ 'runner'    : 'vimproc',
        \ 'runner/vimproc/updatetime' : 1000,
        \ 'outputter/buffer/split': ':botright 8sp',
    \},
\}


"------------------------
if has('unix')
  colorscheme murphy
endif
" special ky coler set
hi SpecialKey guibg=NONE guifg=Gray40

" user shortcuts
" date
nmap <Space>dt <Esc>a<C-R>=strftime("%Y-%m-%d")<CR><Esc>
nnoremap <silent> <Space>ew :e ~/workspace<CR>
nnoremap <silent> <Space>nw :new ~/workspace<CR>
nnoremap <silent> <Space>nv :new ~/.vimrc<CR>
nnoremap <silent> <Space>ng :new ~/.gvimrc<CR>
