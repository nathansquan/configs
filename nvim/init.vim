syntax on
set nu rnu
set guicursor=
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set noswapfile
set nobackup
set nohlsearch
set incsearch
set hidden
set noerrorbells
set scrolloff=8
set signcolumn=yes
set encoding=utf-8
set fileencodings=utf-8
set textwidth=80
set omnifunc=syntaxcomplete#Complete
set background=dark
filetype plugin indent on


"this is a comment
call plug#begin('~/.vim/plugged')
Plug 'junegunn/seoul256.vim' " Color scheme
"Plug 'vim-pandoc/vim-pandoc' " Pandoc stuff
"Plug 'vim-pandoc/vim-pandoc-syntax' " Pandoc stuff
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf'
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'reedes/vim-pencil' " Super-powered writing things
Plug 'tpope/vim-abolish' " Fancy abbreviation replacements
Plug 'junegunn/limelight.vim' " Highlights only active paragraph
Plug 'junegunn/goyo.vim' " Full screen writing mode
Plug 'reedes/vim-lexical' " Better spellcheck mappings
Plug 'reedes/vim-litecorrect' " Better autocorrections
Plug 'reedes/vim-textobj-sentence' " Treat sentences as text objects
Plug 'reedes/vim-wordy' " Weasel words and passive voice
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
Plug 'arcticicestudio/nord-vim'
Plug 'gruvbox-community/gruvbox'
call plug#end()


colorscheme nord
let mapleader = " "

" COC SETTINGS --------------------------------------------------------
"augroup coc
"		autocmd!
"		autocmd FileType json syntax match Comment +\/\/.\+$+
"augroup END
"
"call coc#config('list.source.bibtex', {
"  \  'files': [
"  \    '/Users/nathansquan/Documents/Notes/global.bib'
"  \  ]
"  \})


" FZF-BIBTEX SETTINGS -------------------------------------------------
let $FZF_BIBTEX_CACHEDIR = '/Users/nathansquan/Documents/Notes/bibtex_cache'
let $FZF_BIBTEX_SOURCES = '/Users/nathansquan/Documents/Notes/global.bib'

" fzf to insert citation to selected items
function! s:bibtex_cite_sink(lines)
    let r=system("bibtex-cite ", a:lines)
    execute ':normal! a' . r
endfunction

" fzf to insert pretty markdown versions of selected items
function! s:bibtex_markdown_sink(lines)
    let r=system("bibtex-markdown ", a:lines)
    execute ':normal! a' . r
endfunction

nnoremap <silent> <leader>c :call fzf#run({
                        \ 'source': 'bibtex-ls',
                        \ 'sink*': function('<sid>bibtex_cite_sink'),
                        \ 'up': '40%',
                        \ 'options': '--ansi --layout=reverse-list --multi --prompt "Cite> "'})<CR>

nnoremap <silent> <leader>m :call fzf#run({
                        \ 'source': 'bibtex-ls',
                        \ 'sink*': function('<sid>bibtex_markdown_sink'),
                        \ 'up': '40%',
                        \ 'options': '--ansi --layout=reverse-list --multi --prompt "Markdown> "'})<CR>

function! s:bibtex_cite_sink_insert(lines)
    let r=system("bibtex-cite ", a:lines)
    execute ':normal! a' . r
    call feedkeys('a', 'n')
endfunction

inoremap <silent> @@ <c-g>u<c-o>:call fzf#run({
                        \ 'source': 'bibtex-ls',
                        \ 'sink*': function('<sid>bibtex_cite_sink_insert'),
                        \ 'up': '40%',
                        \ 'options': '--ansi --layout=reverse-list --multi --prompt "Cite> "'})<CR>


" GOYO SETTINGS ------------------------------------------------------
" Goyo remap
nnoremap <C-g> :Goyo<CR>

" Goyo auto open for all markdown files
augroup goyo_md
		autocmd!
		autocmd FileType markdown Goyo
augroup END

set incsearch
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey


" PENCIL SETTINGS ----------------------------------------------------
augroup pencil
   autocmd!
   autocmd filetype markdown,mkd call pencil#init()
       \ | call lexical#init()
       \ | call litecorrect#init()
       \ | setl spell spl=en_us fdl=4 noru nonu nornu
       \ | setl fdo+=search
  augroup END
 " Pencil / Writing Controls {{{
   let g:pencil#wrapModeDefault = 'soft'
   let g:pencil#textwidth = 80
   let g:pencil#joinspaces = 0
   let g:pencil#cursorwrap = 1
   let g:pencil#conceallevel = 3
   let g:pencil#concealcursor = 'c'
   let g:pencil#softDetectSample = 20
   let g:pencil#softDetectThreshold = 130
 " }}}


" vim-pandoc SETTINGS -----------------------------------------------
"let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
"let g:pandoc#modules#disabled = ["folding"]
"" Allow vim-pandoc auto execute pandoc on writes
"let g:pandoc#command#autoexec_on_writes = 1
"let g:pandoc#command#autoexec_command = "Pandoc! pdf --citeproc"
""bib options - generating bibliography relies on YAML entry pointing to bibtex
""file. FZF-BIBTEX works to omnicomplete but can't generate bib. Is there a way
""to create autocmd that uses pandoc to generate bib in pdf as well?
""
""
"let g:pandoc#biblio#use_bibtool = 1
"let g:pandoc#completion#bib#mode = 'citeproc'
"let g:pandoc#biblio#sources = 'g'
"let g:pandoc#biblio#bibs = ['Users/nathansquan/Documents/Notes/global.bib']

" pandoc LetAnthroBurn.md --citeproc --bibliography=/Users/nathansquan/Documents/Notes/global.bib -o LetAnthroBurn.pdf
" Working pandoc bibliography

" Create bibliography on writes
" augroup my_markdown
"     autocmd!
"     autocmd BufWritePost :<c-u>silent call system('pandoc '.expand('%:p:S').' -o '.expand('%:p:r:S').'.pdf')<cr>
" augroup END

" Generate pdf while .md file is open using F9
augroup md_pdf_bib
    autocmd!
    autocmd FileType markdown nnoremap <F9> :<c-u>silent call system('pandoc '.expand('%:p:S').' --citeproc --bibliography=/Users/nathansquan/Documents/Notes/global.bib -o '.expand('%:p:r:S').'.pdf')<cr>
augroup END



" ZETTELKASTEN SETTINGS --------------------------------------------
"set path+=**
"" declare var that holds the location of the Zettelkasten
"let g:zettelkasten = "/Users/nathansquan/Documents/Zettelkasten/"
"
"" define custom command to prefill timestamp and extension and prompts you for
"" the name of your note
"command! -nargs=1 NewZettel :execute ":e" zettelkasten . strftime("%Y%m%d%H%M") . "-<args>.md"
"
"" Declare mapping to call NewZettel
"nnoremap <leader>nz :NewZettel
"
"" Map CtrlP
"nnoremap <leader>p :CtrlP <CR>
"" CtrlP function for inserting a markdown link with Ctrl-X
"function! CtrlPOpenFunc(action, line)
"   if a:action =~ '^h$'    
"      " Get the filename
"      let filename = fnameescape(fnamemodify(a:line, ':t'))
"	  let filename_wo_timestamp = fnameescape(a:line)
"
"      " Close CtrlP
"      call ctrlp#exit()
"      call ctrlp#mrufiles#add(filename)
"
"      " Insert the markdown link to the file in the current buffer
"	  let mdlink = "[[ ".filename_wo_timestamp." ]]( ".filename." )"
"      put=mdlink
"  else    
"      " Use CtrlP's default file opening function
"      call call('ctrlp#acceptfile', [a:action, a:line])
"   endif
"endfunction
"
"let g:ctrlp_open_func = { 
"         \ 'files': 'CtrlPOpenFunc',
"         \ 'mru files': 'CtrlPOpenFunc' 
"         \ }
"
"
"function! HandleFZF(file)
"    "let filename = fnameescape(fnamemodify(a:file, ":t"))
"    "why only the tail ?  I believe the whole filename must be linked unless everything is flat ...
"    let filename = fnameescape(a:file)
"    let filename_wo_timestamp = fnameescape(a:file)
"     " Insert the markdown link to the file in the current buffer
"    let mdlink = "[ ".filename_wo_timestamp." ]( ".filename." )"
"    put=mdlink
"endfunction
"
"command! -nargs=1 HandleFZF :call HandleFZF(<f-args>)
"nnoremap <leader>zf :call fzf#run({'sink': 'HandleFZF'})
"
"
"
"" Method by https://www.kdwarn.dev/blog/a-zettelkasten-with-vim-and-bash/
"
"noremap <Leader>l :let @y = "[[" . expand("%") . "]] " <bar> :1,1y z <bar> let @" = @y . @z<CR>
