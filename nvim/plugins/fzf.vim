Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'




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


