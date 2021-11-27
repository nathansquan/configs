Plug 'ncm2/ncm2'    " completion [dep]: nvim-0.2.2, nvim-yarp, python3

" ncm2 
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
let g:python3_host_prog='/usr/bin/python3'            " ncm2-jedi
