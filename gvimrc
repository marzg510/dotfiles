set lines=40 columns=130

if has('unix')
  unmap  <expr> <C-F>
  iunmap <expr> <C-F>
  cunmap <expr> <C-F>
endif

if has('win32') || has('win64')
  set guifont=Consolas:h10,Lucida_Console:h10:w5
  set guifontwide=MS_Gothic:h10
endif

if has('unix')
  set guifont=Dejavu\ Sans\ Mono\ 9
"  set guifont=Ubuntu\ Mono\ Regular\ 11
endif


if has('win32') || has('win64')
  set printfont=MS_Mincho:h10:cSHIFTJIS
endif
set printheader=%<%f%h%m%=Page%N
 
set guioptions-=T
 
"------------------------
gui
if has('win32') || has('win64')
  set transparency=200 " ウインドウを半透明に
endif
if has('unix')
  colorscheme murphy
  " special ky coler set
  hi SpecialKey guibg=NONE guifg=Gray40
  call system('xprop -f _NET_WM_WINDOW_OPACITY 32c -set _NET_WM_WINDOW_OPACITY -id "' . v:windowid . '" $(( 4294967296 * 80 / 100 ))')
  command! Transoff call system('xprop -f _NET_WM_WINDOW_OPACITY 32c -set _NET_WM_WINDOW_OPACITY -id "' . v:windowid . '" $(( 4294967295 ))')
else
  colorscheme darkblue
endif
"------------------------

