" General settings
set nocompatible
set relativenumber
set encoding=utf-8
set number
set ruler
set hlsearch
set dictionary+=/usr/share/dict/words
set showmode
set smarttab
set smartindent
set cursorline
set switchbuf=usetab
set t_Co=256
set pastetoggle=<F2>
set listchars=tab:▸\ ,eol:¬
set wildmode=longest,list,full
set wildmenu
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
" Enable folding
set foldmethod=indent
set foldlevel=99
let $PAGER=''

" Key mappings
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
"nnoremap <F8> :sbnext<CR>
nnoremap <F9> :QuickRun<CR>
"nnoremap <S-F8> :sbprevious<CR>
"nnoremap <C-Left> :tabprevious<CR>
"nnoremap <C-Right> :tabnext<CR>
map <C-n> :NERDTreeToggle<CR>
":inoremap <c-s> <Esc>:Update<CR>
nnoremap <F5> :buffers<CR>:buffer<Space>
" map creation of cscope db to F6
nnoremap <silent> <F6> :!cscope -bR<CR>
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
nmap <leader>t :set expandtab<CR>:retab<CR>
" Window navigation
nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-Down> :wincmd j<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-Right> :wincmd l<CR>

nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>
filetype off                  " required

" Plugins
" Load vim-plug
if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
    execute '!curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif
call plug#begin('~/.local/share/nvim/plugged')

Plug 'bling/vim-airline'   	    	    " Lean & mean status/tabline for vim
Plug 'vim-airline/vim-airline-themes'   " Themes pack
Plug 'scrooloose/nerdtree' 	    	    " Project and file navigation
Plug 'tpope/vim-surround'	   	        " Parentheses, brackets, quotes, XML tags, and more
Plug 'tpope/vim-fugitive'	   	        " a Git wrapper so awesome, it should be illegal
Plug 's3rvac/AutoFenc'                  " Auto File Encoding plugin
Plug 'thinca/vim-quickrun'              " Run commands easily
Plug 'mhinz/vim-signify'                " Show diff in style
Plug 'mhinz/vim-startify'               " Show fancy start screen
Plug 'vim-syntastic/syntastic'      " Syntastic is a syntax checking plugin for Vim created by Martin Grenfell
Plug 'neomake/neomake'                  " Async checker
Plug 'easymotion/vim-easymotion'        " Vim motion on speed!
Plug 'vivien/vim-linux-coding-style'    " Linux kernel coding style
Plug 'aperezdc/vim-template'  	        " Simple Vim templates plugin
Plug 'flazz/vim-colorschemes'           " One pack to rule them all
Plug 'ctrlpvim/ctrlp.vim'         	    " Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plug 'mileszs/ack.vim'                  " Silver search
Plug 'vim-scripts/indentpython.vim'    " Python indentation
"Plug 'scrooloose/nerdcommenter'         " Commenting made easy
Plug 'junegunn/vim-easy-align'          " Easy-align plugin
Plug 'sudar/comments.vim'
Plug 'mfulz/cscope.nvim'
"Plug 'bbchung/Clamp'

"------------------=== Other ===----------------------
"Plug 'Valloric/YouCompleteMe'          " Powerful completion
"Plug 'Shougo/deoplete.nvim'            " Another completion plugin
"Plug 'takac/vim-hardtime'              " Useful for learning
"Plugin 'fisadev/FixedTaskList.vim'  	" Pending tasks list
"Plugin 'rosenfeld/conque-term'      	" Consoles as buffers
"Plugin 'majutsushi/tagbar'          	" Class/module browser
"Plugin 'juneedahamed/vc.vim'            " Version control plugin
"Plug 'tmhedberg/SimpylFold'             " Simple folding
call plug#end()            		    " required

filetype on
filetype plugin on
filetype plugin indent on
syntax on

colo xoria256
" Plugin settings
let g:linuxsty_patterns = [ "/usr/src/", "/home/x/src/linux", "/home/x/src/ldd3" ]

let g:signify_vcs_list = [ 'git', 'svn' ]
"let g:vc_browse_cache_all = 1


let g:airline_powerline_fonts = 1
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_loc_list_height = 5
"let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 1
"
"let g:syntastic_error_symbol = 'x'
"let g:syntastic_style_error_symbol = '?'
"let g:syntastic_warning_symbol = '!'
"let g:syntastic_style_warning_symbol = '^'
"let g:syntastic_cpp_compiler = 'clang++'
"let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
"let g:syntastic_cpp_check_header = 1

"highlight link SyntasticErrorSign SignColumn
"highlight link SyntasticWarningSign SignColumn
"highlight link SyntasticStyleErrorSign SignColumn
"highlight link SyntasticStyleWarningSign SignColumn

" Setup some default ignores
let g:ctrlp_custom_ignore = {
   \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
   \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in
" version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

" Use a leader instead of the actual named binding
nmap <leader>p :CtrlP<cr>

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

" Misc
" jump to last cursor position when opening a file
" dont do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
"autocmd! BufWritePost * Neomake
function! SetCursorPosition()
        if &filetype !~ 'svn\|commit\c'
                if line("'\"") > 0 && line("'\"") <= line("$")
                        exe "normal! g`\""
                        normal! zz
                endif
        end
endfunction

" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command -nargs=0 -bar Update if &modified 
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
nnoremap <silent> <C-S> :<C-u>Update<CR>

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
let g:hardtime_showmsg = 1
let g:hardtime_default_on = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'
let g:ycm_extra_conf_vim_data   = ['&filetype']
let g:ycm_autoclose_preview_window_after_completion=1
"map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
" Path to store the cscope files (cscope.files and cscope.out)
" Defaults to '~/.cscope'
let g:cscope_dir = '~/.nvim-cscope'

" Map the default keys on startup
" These keys are prefixed by CTRL+\ <cscope param>
" A.e.: CTRL+\ d for goto definition of word under cursor
" Defaults to off
let g:cscope_map_keys = 1

" Update the cscope files on startup of cscope.
" Defaults to off
let g:cscope_update_on_start = 1
