" Pathogen
call pathogen#infect()
filetype plugin indent on
syntax on

" define your colors
if !exists("autocmd_colorscheme_loaded")
  let autocmd_colorscheme_loaded = 1
  autocmd ColorScheme * highlight TodoRed      ctermbg=14 guibg=#002b37 ctermfg=1    guifg=#E01B1B
  autocmd ColorScheme * highlight TodoOrange   ctermbg=14 guibg=#002b37 ctermfg=5    guifg=#E0841B
  autocmd ColorScheme * highlight TodoYellow   ctermbg=14 guibg=#002b37 ctermfg=130  guifg=#E0D91B
  autocmd ColorScheme * highlight Loud         ctermbg=9  guibg=#002b37 ctermfg=10   guifg=#E01B1B
endif

" labels for colors
if has("autocmd")
    if v:version > 701
        autocmd Syntax * call matchadd('TodoRed',  '\W\zs\(FIX\)')
        autocmd Syntax * call matchadd('TodoOrange', '\W\zs\(TODO\)')
        autocmd Syntax * call matchadd('TodoYellow', '\W\zs\(DEBUG\)')
        autocmd Syntax * call matchadd('Loud',  '\W\zs\(RISK\)')
    endif
endif

let mapleader = ","
set modelines=0
set nocompatible
set tabstop=4
set softtabstop=4
set shiftwidth=4
set nobackup
set expandtab
let g:solarized_termcolors=256
colorscheme solarized
set background=dark
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set foldmethod=indent
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
set wrap
set textwidth=79
set formatoptions=qrn1
set list
set listchars=tab:>-,eol:$,trail:~,nbsp:_
set gfn=Consolas\ Bold\ 12
set guioptions-=T
set autochdir
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ %=%c.%l/%L\ (%p%%)
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" set width to 72 when editing mail files with mutt
"au BufRead /tmp/mutt-* set tw=72

nnoremap <leader><space> :noh<cr>
nnoremap / /\v
vnoremap / /\v
inoremap kj <Esc>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
nnoremap ; :

" delimitMate
inoremap <Leader><Tab> <C-R>=delimitMate#JumpAny("\<Leader>\<Tab>")<CR>

" Vimroom
nnoremap <silent> <Leader>mz :VimroomToggle<cr>

" Viewport Controls
" ie moving between split panes
map <silent><leader>h <C-w>h
map <silent><leader>j <C-w>j
map <silent><leader>k <C-w>k
map <silent><leader>l <C-w>l

" edit my .vimrc file in a split
map <leader>v :sp ~/.vimrc<cr>

" edit my .vimrc file
map <leader>e :e ~/.vimrc<cr>

" update the system settings from my vimrc file
map <leader>u :source ~/.vimrc<cr>

" folds
au FocusLost * :wa
au BufWinLeave * mkview
au BufWinEnter * silent loadview

au FileType py set smartindent

" Tagbar
let g:tagbar_usearrows = 1
nnoremap <leader>z :TagbarToggle<CR>
nnoremap <leader>t :TagbarOpenAutoClose<CR>

" NERD Tree toggle 
map <C-n> :NERDTreeToggle<CR>
