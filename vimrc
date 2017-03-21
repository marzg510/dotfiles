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
set statusline+=[%{&fileformat}] " file format
set statusline+=[%{&fileencoding}] " file encoding
set statusline+=[%l/%L(%p%%)] " 現在行数/全行数/percentage
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

" Fileformat
if has('win32') || has('win64')
    set fileformat=dos
endif

" Windows key bind(Ctrl-C)
if has('win32') || has('win64')
    source $VIMRUNTIME/mswin.vim
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
  au BufNewFile,BufRead *.rhtml set tabstop=2 shiftwidth=2
  au BufNewFile,BufRead *.rb set tabstop=2 shiftwidth=2
  au BufNewFile,BufRead *.yml set tabstop=2 shiftwidth=2
  au BufNewFile,BufRead *.erb set tabstop=2 shiftwidth=2
  au User Rails* set fenc=utf-8
augroup END

augroup FileTypeIndent
    au!
    au BufNewFile,BufRead *.sql setlocal tabstop=2 shiftwidth=2 expandtab
augroup END

" enable omnifunc
set omnifunc=syntaxcomplete#Complete
" <C-Space> omni func
imap <Nul> <C-x><C-o>
if has('win32') || has('win64')
    imap <C-Space> <C-x><C-o>
endif

" disable auto window resize
set noequalalways

" new window below
"set splitbelow
" new window right
"set splitright

"------------------------
" setting for netrw
" 'v'でファイルを開くときは右側に開く。(デフォルトが左側なので入れ替え)
let g:netrw_altv = 1
" 'o'でファイルを開くときは下側に開く。(デフォルトが上側なので入れ替え)
let g:netrw_alto = 1

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

"------------------------
" setting for memolist
nnoremap <Space>mn  :MemoNew<CR>
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
" setting for VimShell
nnoremap <Space>vs   :VimShell<CR>
nnoremap <Space>vp   :VimShellPop<CR>

"------------------------
colorscheme murphy

