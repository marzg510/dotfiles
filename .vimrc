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
 

syntax enable

" <C-Space> omni func
imap <Nul> <C-x><C-o>

" enable omnifunc
set omnifunc=syntaxcomplete#Complete

au BufNewFile,BufRead * set tabstop=4 shiftwidth=4
au BufNewFile,BufRead *.rhtml set tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.rb set tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.yml set tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.erb set tabstop=2 shiftwidth=2
au User Rails* set fenc=utf-8

"NeoBundle Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/masaru/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('/home/masaru/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neocomplete'
"NeoBundle 'Shougo/neosnippet.vim'
"NeoBundle 'Shougo/neosnippet'
"NeoBundle 'Shougo/neosnippet-snippets'
"NeoBundle 'tpope/vim-fugitive'
"NeoBundle 'ctrlpvim/ctrlp.vim'
"NeoBundle 'flazz/vim-colorschemes'
"NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/vimproc'
"NeoBundleLazy 'Shougo/vimfiler'
"NeoBundle 'Shougo/neomru.vim.git'
NeoBundle 'tpope/vim-endwise'
"NeoBundle 'vim-scripts/dbext.vim'
"NeoBundle 'vim-scripts/twilight'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

" neocompleteの設定
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.

" .や::を入力したときにオムニ補完が有効になるようにする
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplete#force_omni_input_patterns.eruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

"rsenseのインストールフォルダがデフォルトと異なるので設定
"let g:rsenseHome = expand("~/.rbenv/shims/rsense")
"let g:rsenseUseOmniFunc = 1
"let g:neocomplete#sources#rsense#home_directory = '~/.rbenv/shims/rsense'

" unite.vim
"nnoremap    [unite]   <Nop>
"nmap    ,u [unite]
"nnoremap [unite]u  :<C-u>Unite -no-split<Space>
"nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer<CR>
"nnoremap <silent> [unite]b :<C-u>Unite<Space>bookmark<CR>
"nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
"nnoremap <silent> [unite]r :<C-u>UniteWithBufferDir file<CR>
"nnoremap <silent> ,vr :UniteResume<CR>

" VimFiler
" 標準のファイラーを置き換え
"let g:vimfiler_as_default_explorer = 1
"" 起動ショートカット
"noremap <silent> :tree :VimFiler -split -simple -winwidth=45 -no-quit
"noremap <C-X><C-T> :VimFiler -split -simple -winwidth=45 -no-quit<ENTER>

""preview interpreter's output(Tip #1244)
"function! Ruby_eval_vsplit() range
"    if &filetype == "ruby"
"        let src = tempname()
"        let dst = "RubyOutput"
"        " put current buffer's content in a temp file
"        silent execute ": " . a:firstline . "," . a:lastline . "w " . src
"        " open the preview window
"        silent execute ":pedit! " . dst
"        " change to preview window
"        wincmd P
"        " set options
"        setlocal buftype=nofile
"        setlocal noswapfile
"        setlocal syntax=none
"        setlocal bufhidden=delete
"        " replace current buffer with ruby's output
"        silent execute ":%! ruby " . src . " 2>&1 "
"        " change back to the source buffer
"        wincmd p
"    endif
"endfunction
""<F10>でバッファのRubyスクリプトを実行し、結果をプレビュー表示
"vmap <silent> <F10> :call Ruby_eval_vsplit()<CR>
"nmap <silent> <F10> mzggVG<F10>`z
"map  <silent> <S-F10> :pc<CR>

"filetype indent off

" erbのタグ閉じ
"inoremap <expr> % Lt_Percent_Completion()
"function Lt_Percent_Completion()
"  if matchstr(getline('.'), '.', col('.') -1 ) == ">"
"        return "\%\%\<Left>"
"    else
"        return "\%"
"    end
"endf


" ruby dictionary for neocomplete
" git clone https://github.com/pocke/dicts
let g:neocomplete#sources#dictionary#dictionaries = {
\   'ruby': $HOME . '/dicts/ruby.dict',
\ }

"colorscheme desert
colorscheme murphy
"colorscheme default
"colorscheme twilight
