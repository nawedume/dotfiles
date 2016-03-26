syntax on

set encoding=utf-8

set t_Co=16
set background=dark
let base16colorspace=256
" Change folding colors
hi link Folded Statement
hi link FoldColumn Statement

" Link diffAdded and diffRemoved to some things that happen to be green and red
" respectively
hi link diffAdded Statement
hi link diffRemoved Special
hi link diffLine Comment

" I have no idea why this is necessary - for some reason,
" ctermbg and ctermfg are being swapped *only* for Comment and
" vimLineComment
" hi Comment ctermfg=8 ctermbg=10
" hi vimLineComment ctermfg=8 ctermbg=10

let g:syntastic_auto_loc_list=0
let g:syntastic_enable_signs=1
set mouse=a

filetype off

" Use system clipboard
set clipboard=unnamed

" Set up Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Bundles (plugins)
Bundle 'Lokaltog/vim-powerline'

if v:version < 703 || v:version == 703 && !has('patch584')
  Bundle 'tsaleh/vim-supertab'
else
  Bundle 'Valloric/YouCompleteMe'
endif

Bundle 'airblade/vim-gitgutter'
Bundle 'godlygeek/tabular'
Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'python_match.vim'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-scripts/matchit.zip'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'phleet/vim-arcanist'

" Language Support
Bundle 'digitaltoad/vim-jade'
Bundle 'groenewege/vim-less'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'kchmck/vim-coffee-script'
Bundle 'nono/vim-handlebars'
Bundle 'skammer/vim-css-color'
Bundle 'derekwyatt/vim-scala'
Bundle 'wavded/vim-stylus'
Bundle 'pangloss/vim-javascript'

" Color Schemes
Bundle 'chriskempson/base16-vim'

colorscheme base16-ocean

set conceallevel=2
let g:tex_conceal="admg"
set autoread
set autowrite
set laststatus=2

set backspace=2 "Make backspace work as expected on Mac OS X
set autoindent  "Auto Indent code - This simply retains indentation level

" Showing whitespace
set list listchars=tab:\ \ ,trail:·

" General indentation settings

" Note that these vary from language to language
set tabstop=4   "Set space width of tabs
set softtabstop=4
set sw=4
set expandtab

set splitright  "By default, split to the right
set splitbelow
set number      "Add line numbers
set ruler       "Display Cursor Position
set title       "Display filename in titlebar
set titleold=   "Prevent the "Thanks for flying Vim"
set nohlsearch

set backupdir=/Users/jlfwong/.vim/backup/,.

set incsearch   "Display search resultings as you type
set ignorecase
set smartcase
set wildmenu

set textwidth=80
set formatoptions=tcroqnl1

" Mark the 81st column
if exists('+colorcolumn')
  set colorcolumn=+1
endif

filetype plugin on
filetype indent off

let mapleader=","
let maplocalleader=","

" Round indentation to multiple of shiftwidth
set shiftround

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

set statusline=%f    " Path.
set statusline+=%m   " Modified flag.
set statusline+=%r   " Readonly flag.
set statusline+=%w   " Preview window flag.

set statusline+=\    " Space.

set statusline+=%#redbar#                " Highlight the following as a warning.
set statusline+=%{SyntasticStatuslineFlag()} " Syntastic errors.
set statusline+=%*                           " Reset highlighting.

set statusline+=%=   " Right align.

" File format, encoding and type.  Ex: "(unix/utf-8/python)"
set statusline+=(
set statusline+=%{&ft}                        " Type (python).
set statusline+=)

" Line and column position and counts.
set statusline+=\ (L%l\/%L,\ C%03c)

" Disable ex mode shortcut
nnoremap Q q

" Don't move on *, but turn on hlsearch
nnoremap * :set hlsearch<CR>*<c-o>

" Toggle hlsearch
nnoremap <Leader>h :set hlsearch!<CR>

" Navigating by jumps
nnoremap <C-H> <C-O>
nnoremap <C-L> <C-I>

" Easier to type, and I never use the default behavior.
nnoremap H ^
nnoremap L g_

" let [jk] go down and up by display lines instead of real lines. Let g[jk]
" do what [jk] normally does
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

" Git Grep
nnoremap <Leader>gg :GitGrep<space>
vnoremap <Leader>gg "gy:GitGrep "<C-R>g"<CR>
vnoremap <Leader>gr "gy:GitGrep "<C-R>g"<CR>:Qdo %s/<C-R>g/

" Sort
" Select a block of text in visual mode then hit ,s
vnoremap <Leader>s :sort<CR>

" Map Semicolon to : for faster command execution
nmap ; :

" <Tab> and <S-Tab> switch between split screens
nnoremap <Tab> <C-w><C-w>
nnoremap <S-Tab> <C-w>W

" Mapping tab also remaps C-i, so make C-l do what C-i used to do
nnoremap <C-l> <C-i>

" NERDTree
map <Leader>n :NERDTreeToggle<CR>

" Gundo
nmap <Leader>u :GundoToggle<CR>

" Make
nmap <Leader>m :make<CR>

",p copies the current filepath
nmap <Leader>p :!echo % \| tr -d '\n' \| pbcopy<CR><CR>

" CtrlP
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_clear_cache_on_exit = 1
nnoremap <leader>b :CtrlPBuffer<CR>
set wildignore+=*.o,.git,*.jpg,*.png,*.swp,*.d,*.gif,*.pyc,node_modules,*.class,*.crf,*.hg,*.orig,.meteor,*.acn,*.acr,*.alg,*.aux,*.bbl,*.blg,*.dvi,*.fdb_latexmk,*.glg,*.glo,*.gls,*.idx,*.ilg,*.ind,*.ist,*.lof,*.log,*.lot,*.maf,*.mtc,*.mtc0,*.nav,*.nlo,*.out,*.pdfsync,*.ps,*.snm,*.synctex.gz,*.toc,*.vrb,*.xdy,*.pdf,*.bcf,*.run.xml

let g:path_to_matcher = '~/dotfiles/matcher/matcher'
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files . -co --exclude-standard']
let g:ctrlp_match_func = { 'match': 'GoodMatch' }
function! GoodMatch(items, str, limit, mmode, ispath, crfile, regex)
  " Create a cache file if not yet exists
  let cachefile = ctrlp#utils#cachedir().'/matcher.cache'
  if !( filereadable(cachefile) && a:items == readfile(cachefile) )
    call writefile(a:items, cachefile)
  endif
  if !filereadable(cachefile)
    return []
  endif

  " a:mmode is currently ignored. In the future, we should probably do
  " something about that. the matcher behaves like "full-line".
  let cmd = g:path_to_matcher.' --limit '.a:limit.' --manifest '.cachefile.' '
  if !( exists('g:ctrlp_dotfiles') && g:ctrlp_dotfiles )
    let cmd = cmd.'--no-dotfiles '
  endif
  let cmd = cmd.a:str

  return split(system(cmd), "\n")

endfunction

" OmniCompletion
set completeopt=longest,menuone
set omnifunc=syntaxcomplete#Complete
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

" SnipMate
let g:snippets_dir="~/.vim/snippets/,~/.vim/bundle/snipmate.vim/snippets/"
ino <silent> <c-r><tab> <c-r>=TriggerSnippet()<cr>
snor <silent> <c-r><tab> <esc>i<right><c-r>=TriggerSnippet()<cr>
ino <silent> <c-r><c-s> <c-r>=ShowAvailableSnips()<cr>

" Search for selected text, forwards or backwards.
" http://vim.wikia.com/wiki/Search_for_visually_selected_text
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
  \:set hlsearch<CR><C-o>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" GUI Options
if has("gui_running")
  set guioptions=egt
  let g:Powerline_symbols = 'fancy'
endif

" Qdo is the equivalent of argdo but for the quickfix list
command! -nargs=0 -bar Qargs execute 'args ' . QuickfixFilenames()

" Contributed by "ib."
" http://stackoverflow.com/questions/5686206/search-replace-using-quickfix-list-in-vim#comment8286582_5686810
command! -nargs=1 -complete=command -bang Qdo exe 'args '.QuickfixFilenames() | argdo<bang> <args>

function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

"LANGUAGE SPECIFIC COMMANDS
"
" For all languages:
"  <Leader>c - Syntax Check / Compile
"  <Leader>r - Execute
"
" See ftplugin/*.vim

autocmd BufNewFile,BufRead *.json set ft=json
