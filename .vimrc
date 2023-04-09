set nocompatible              " be iMproved, required

so ~/.vim/plugins.vim

"Original file follows

"set background=dark
set number                                          "Let's activate line numbers
set termguicolors				    "allow for 24 bit colors even in terminal
set mouse=a					    "mouse can be used in PuTTY
set noerrorbells visualbell t_vb=		    "No damn bells
set foldcolumn=4
"set fdm=indent					    "foldmode=indent
set fdm=syntax					    "foldmode=indent
set foldlevelstart=4
set foldenable


set clipboard=exclude:.*

set tags+=tags,tags.vendors
"set autowriteall                                    "automatically write the file when switching buffers

set tabstop=8
set shiftwidth=4
set softtabstop=4
set expandtab

let g:snipMate = { 'snippet_version' : 0 }
let javaScript_fold=1
let php_folding=1
let mapleader = ','                                 "Leader smbol for mappings should be , instead of \
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"------------ Visuals ----------------
colorscheme atom-dark
set guifont=Fira\ Code\ 10
set guioptions-=e				    "We don't want GUI tabs
set linespace=10



"------------ Searching ----------------
set hlsearch					    "highlight search
set incsearch                                       "enable incremental searching


"------------ Split Management ----------------
set splitbelow  "new split is created below (default is above)
set splitright	"new split is created on the right (default is on the left)

"nmap <C-J> <C-W><C-J>	"Make split navigation easier
"nmap <C-K> <C-W><C-K>
"nmap <C-H> <C-W><C-H>
"nmap <C-L> <C-W><C-L>


"------------ Mappings ----------------

"Make it easy to edit the .vimrc file.
nmap <Leader>ev :tabedit $MYVIMRC<cr>

"Make it easy to edit the plugins file
nmap <Leader>ep :tabedit ~/.vim/plugins.vim<cr>

"Let the user allow to edit snippets
nmap <leader>es :e ~/.vim/snippets/

"Add simple highlight removal
nmap <Leader><space> :nohlsearch<cr>

"Make it easy to edit the .vimrc file.
nmap <Leader>ev :tabedit $MYVIMRC<cr>

"Add simple highlight removal
nmap <Leader><space> :nohlsearch<cr>

"Shortcut for find tag
nmap <Leader>f :tag<space>

"Make NERDTree easier to toggle
"nmap <S-F1> :NERDTreeToggle<cr>

nmap <A-1> :NERDTreeToggle<cr>

nmap <c-R> :CtrlPBufTag<cr>
nmap <c-E> :CtrlPMRUFiles<cr>

"Map c-] to c-+ instead (Go to definition)
nmap <c-+> <c-]>			
"Map c-^ to <c-#> instead (Go to previous file)
nmap <c-_> <c-^>

"------------ Plugins ----------------
"/
"/ NERDTree
"/
let NERDTreeHijackNetrw = 0


"------------ For DocBlocks ----------------
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <leader>d :call pdv#DocumentWithSnip()<cr>

"------------ Auto commands ----------------

"Automatically source the .vimrc file on save

augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

autocmd BufWinEnter * silent! :%foldopen!


function! IPhpInsertUse()
	call PhpInsertUse()
	call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<cr>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<cr>


function! IPhpExpandClass()
	call PhpExpandClass()
	call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<cr>
autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<cr>
