set number relativenumber
set ai
set si
set noshowmode
set nohlsearch
set scrolloff=7
set nobackup
set nowritebackup
set updatetime=100
set nocompatible
set shiftwidth=4
set signcolumn=yes

filetype off
filetype indent on

au BufNewFile,BufRead *.ejs set filetype=html

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-fugitive'

Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'HerringtonDarkholme/yats.vim' " typescript syntax
Plug 'pangloss/vim-javascript' " javascript syntax
Plug 'MaxMEllon/vim-jsx-pretty' " jsx
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

Plug 'ishan9299/nvim-solarized-lua'
Plug 'morhetz/gruvbox'

call plug#end()

set t_Co=256
let g:gruvbox_contrast_light='soft'
let g:gruvbox_contrast_dark='soft'
set background=light
colorscheme gruvbox
highlight Normal ctermbg=NONE
let g:airline_theme='zenburn'

nnoremap <C-n> :NERDTreeFocus<CR>
nnoremap <C-q> :NERDTreeClose<CR>

" Make <CR> to accept selected completion item or notify coc.nvim to format
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" show dot files
let NERDTreeShowHidden=1

" use the system clipboard
set clipboard=unnamed

function TrimWhiteSpace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfunction

autocmd BufWritePre * :call TrimWhiteSpace()

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)

function DeleteSpans()
    :%s/<span[^/>]*>
    :%s/<\/span>
endfunction

function DeleteStyling()
    :%s/style="[^>]*
endfunction
