Plug 'michal-h21/vim-zettel'

" VIM-ZETTEL SETTINGS ------------------------------------------------
" second wiki listed in your g:vimwiki_list variable is your zettelkasten, then you must represent the first wiki in your g:zettel_options list as a set of empty braces
let g:zettel_options = [{}, {"template" :  "~/.config/zettelkasten/mytemplate.tpl"}]
let g:zettel_format = '%Y%m%d%H%M'
let g:zettel_fzf_command = "rg --column --line-number --ignore-case --no-heading --color=always "
let g:zettel_backlinks_title = "Backlinks"
" Open index file of zettelkasten: 2<Leader>ww

" In insert mode when you type [[ the ZettelSearch function is triggered. 
" This runs the silver searcher in a new window split and dynamically shows 
" search results as you type. Hitting enter on one of its search result 
" lines inserts a link to that file in your note.

" inoremap [[ [[<esc>:ZettelSearch<CR>
imap <silent> [[ [[<esc><Plug>ZettelSearchMap

" If you want to insert a link to the current note in another note you 
" can type T in normal mode to copy a formatted wiki link with the 
" current note title as the link text that you can paste in other notes.
nmap T <Plug>ZettelYankNameMap

" You can create a new note with the selected text as the note title by typing
" z.
" xnoremap z :call zettel#vimwiki#zettel_new_selected()<CR>
xmap z <Plug>ZettelNewSelectedMap

" starts a tag search letting you open files with matching tags.
nnoremap <leader>vt :VimwikiSearchTags<space>

" does the same thing but with a full text search.
nnoremap <leader>vs :VimwikiSearch<space>

" This mapping runs two Vimwiki functions that keep the Vimwiki tags file up-to-date and generates an index by tag of file links in the index.wiki file.
nnoremap <leader>gt :VimwikiRebuildTags!<cr>:VimwikiGenerateTagLinks<cr><c-l>

" creates a new zettel based on the template we defined earlier named with a unique zettel ID.
nnoremap <leader>zn :ZettelNew<cr><cr>gg4dd
" when you want to know what zettels link to the current one. It opens a window split with a list of those files.
nnoremap <leader>bl :VimwikiBacklinks<cr>
