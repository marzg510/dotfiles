" This is vimrc_local sample for KaoriYa gvim.
" copy to $VIM/ and modify for local environment.
" ** Attention ** This is sample,Do not link to this file.
"------------------------
" set fileencoding
set fenc=cp932
" open windows automatic
augroup AutoOpen
    autocmd!
    autocmd VimEnter * e ~/memo
    autocmd VimEnter * rightbelow vnew
    autocmd VimEnter * wincmd h
    autocmd VimEnter * 30wincmd |
    autocmd VimEnter * rightbelow new .
    autocmd VimEnter * wincmd l
augroup END

