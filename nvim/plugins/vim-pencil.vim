Plug 'reedes/vim-pencil' " Super-powered writing things

" PENCIL SETTINGS ----------------------------------------------------
"augroup pencil
"   autocmd!
"   autocmd filetype markdown,mkd call pencil#init()
"       \ | call lexical#init()
"       \ | call litecorrect#init()
"       \ | setl spell spl=en_us fdl=4 noru nonu nornu
"       \ | setl fdo+=search
"augroup END
 " Pencil / Writing Controls {{{
   let g:pencil#wrapModeDefault = 'hard'
   let g:pencil#autoformat = 1
   let g:pencil#textwidth = 80
   let g:pencil#joinspaces = 0
   let g:pencil#cursorwrap = 1
   let g:pencil#conceallevel = 3
   let g:pencil#concealcursor = 'c'
   let g:pencil#softDetectSample = 20
   let g:pencil#softDetectThreshold = 130
 " }}}
