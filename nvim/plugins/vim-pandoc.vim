Plug 'vim-pandoc/vim-pandoc'

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



