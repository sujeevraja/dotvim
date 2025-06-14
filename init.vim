" Neovim configuration
" Using native package manager instead of pathogen

" To use plugins from pack directory
filetype plugin on

" Variable for windows specific settings
let g:is_win = has('win32') || has('win64')

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Show currently typed command
set showcmd

" Use spaces instead of tabs
set expandtab

" Highlight search results
set hlsearch

" Incremental search (as you type)
set incsearch

" Ignore case when searching
set ignorecase

" Turn backups off, remove swap files
set nobackup
set noswapfile

" Always show current position
set ruler

" 4 space indentation
set shiftwidth=4

" When searching try to be smart about cases
set smartcase

set smartindent

" 1 tab = 4 spaces
set tabstop=4

" Hide toolbar
set guioptions-=T

" Show line number of every line
set number
set relativenumber

" Switch on syntax highlighting
syntax enable

" Use darcula theme
" colorscheme darcula

" Use solarized
" set background=dark
" colorscheme solarized

" Toggle background (useful only with solarized)
" call togglebg#map("<F5>")

colorscheme slate

" Disabling markdown folding
let g:vim_markdown_folding_disabled=1
set nofoldenable

" No modeline processing please
set modelines=0
set nomodeline

" Show status line
set ls=2

" Command to open vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Command to delete all marks
nnoremap <leader>dm  :delmarks a-zA-Z0-9<cr>

" Map local leader
let maplocalleader = "\\"

if has("gui_running")
  " any code here affects gvim but not console vim
  set lines=50 columns=165

  if g:is_win
    set guifont=Terminus:h12
  endif
else
  " any code here affects console vim but not gvim
endif

" Intuitive split opening
" <C-> mappings are not case-sensitive. So don't have to worry.
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" Disable auto-commenting when starting a new line from a commented line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" configure auto-indentation of braces for C/C++ files
" autocmd Filetype c,cpp inoremap { {<CR><BS><BS>}<Esc>ko<Tab>

"================== Tagbar commands ======================================={{{

" Toggle tagbar
nnoremap <C-t> :TagbarToggle<CR>

" Help tagbar find ctags.exe
if g:is_win
  let g:tagbar_ctags_bin=expand(globpath('~', 'ctags58')).'\ctags.exe'
endif

"===========================================================================}}}

"================== Syntastic commands ====================================={{{

" Make syntastic ignore angular's proprietary errors
let g:syntastic_html_tidy_ignore_errors=[
  \"trimming empty <i>",
  \"trimming empty <span>",
  \"proprietary attribute \"ng-"
\]

" Make syntastic understand C++11
let g:syntastic_cpp_compiler = "g++"
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libC++'

"===========================================================================}}}

"================== NERDTree commands ======================================{{{

" NERDTree commands

" Automatically start with NERDTree
" autocmd VimEnter * NERDTree

" Start NERDTree with ctrl+n
nnoremap <C-n> :NERDTreeToggle<CR>

" Close vim if only buffer left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")
  \ && b:NERDTree.isTabTree()) | q | endif

"===========================================================================}}}

"================== CtrlP settings ========================================={{{

" CtrlP ignores
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = {
  \ 'dir': 'node_modules\|\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$'
  \ }

"================== Handling whitspace ====================================={{{

" Highlight trailing whitespace
match ErrorMsg '\s\+$'


" Removes trailing spaces
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

nnoremap <silent> <Leader>rts :call TrimWhiteSpace()<CR>

"===========================================================================}}}

"================== Vimtex commands ========================================{{{

let g:tex_flavor = "latex"
let g:vimtex_latexmk_continuous = 1

"===========================================================================}}}

" Mark max recommended width
" set colorcolumn=101
" augroup vimrc_autocmds
"   autocmd BufEnter * highlight OverLength ctermbg=darkred ctermfg=white guibg=darkred
"   autocmd BufEnter * match OverLength /\%75v.*/
" augroup END
highlight ColorColumn ctermbg=darkred guibg=darkred
call matchadd('ColorColumn', '\%101v', 100)

" Neovim specific settings
if has('nvim')
    " Use system clipboard by default
    set clipboard+=unnamedplus
    
    " Enable true colors if available
    if has('termguicolors')
        set termguicolors
    endif
    
    " Use Python 3 for Neovim
    let g:python3_host_prog = '/usr/bin/python3'
endif 