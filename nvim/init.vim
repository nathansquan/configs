syntax on
set nu rnu " Set line and relative line number
set guicursor=
set termguicolors
set tabstop=4 softtabstop=4
set shiftwidth=2 " One tab == four spaces
set expandtab " Use spaces instead of tabs
set smartindent
set smarttab
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
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
set updatetime=100 " set update time for gitgutter update

"this is a comment
call plug#begin('~/.vim/plugged')
source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/vim-pandoc.vim
source ~/.config/nvim/plugins/vimwiki.vim
source ~/.config/nvim/plugins/vim-zettel.vim
source ~/.config/nvim/plugins/vim-pencil.vim
source ~/.config/nvim/plugins/vim-abolish.vim
source ~/.config/nvim/plugins/limelight.vim
source ~/.config/nvim/plugins/goyo.vim
source ~/.config/nvim/plugins/vim-lexical.vim
source ~/.config/nvim/plugins/vim-litecorrect.vim
source ~/.config/nvim/plugins/vim-textobj-sentence.vim
source ~/.config/nvim/plugins/vim-wordy.vim
source ~/.config/nvim/plugins/vim-startify.vim
source ~/.config/nvim/plugins/nord-vim.vim
source ~/.config/nvim/plugins/nerdtree.vim
source ~/.config/nvim/plugins/lightline.vim
source ~/.config/nvim/plugins/vim-fugitive.vim
source ~/.config/nvim/plugins/vim-gitgutter.vim
source ~/.config/nvim/plugins/vim-sendtowindow.vim
source ~/.config/nvim/plugins/ncm2.vim " completion [dep]: nvim-0.2.2, nvim-yarp, python3
source ~/.config/nvim/plugins/nvim-yarp.vim
source ~/.config/nvim/plugins/ncm2-bufword.vim
source ~/.config/nvim/plugins/ncm2-path.vim
source ~/.config/nvim/plugins/ncm2-jedi.vim
source ~/.config/nvim/plugins/ncm-R.vim " R completion [dep]: ncm2, Nvim-R
source ~/.config/nvim/plugins/Nvim-R.vim
source ~/.config/nvim/plugins/ale.vim " linting [dep]: pip3 install flake8, install.packages('lintr')
source ~/.config/nvim/plugins/vim-isort.vim " Python sort imports [dep]: pip3 install isort
source ~/.config/nvim/plugins/markdown-preview.nvim
source ~/.config/nvim/plugins/vim-surround.vim
" Plug 'SirVer/ultisnips'              " hotkeys for chunks of code
call plug#end()


colorscheme nord
let mapleader = "\<space>"

" Allow gf to open non-existent files
map gf :edit <cfile><cr>

" Window Splits
set splitbelow splitright
" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize -3<CR>
noremap <silent> <C-Down> :resize +3<CR>
" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K
" Start terminals for R and Python sessions '\tr' or '\tp'
map <Leader>tr :new term://bash<CR>iR<CR><C-\><C-n><C-w>k
map <Leader>tp :new term://bash<CR>ipython3<CR><C-\><C-n><C-w>k
" Map <ESC> to exit terminal mode
tnoremap <Esc> <C-\><C-n>


