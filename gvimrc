set lines=90 columns=200

if has('win32') || has('win64')
  set guifont=Consolas:h10,Lucida_Console:h10:w5
  set guifontwide=MS_Gothic:h10
endif
 

if has('win32') || has('win64')
  set printfont=MS_Mincho:h10:cSHIFTJIS
endif
set printheader=%<%f%h%m%=Page%N
 
set guioptions-=T
 
"------------------------
colorscheme murphy

"------------------------
gui
if has('win32') || has('win64')
  set transparency=200 " ウインドウを半透明に
endif

