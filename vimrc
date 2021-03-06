set rtp+=~/.vim
" usimx  vimrc
set nocompatible

if has('nvim') " got problem with vim-sensible in neovim
  filetype plugin indent on
  syntax enable
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
  set scrolloff=1
  set sidescrolloff=5
endif

" Macvim
if has("gui_macvim")
  set guifont=Menlo:h16
  set incsearch
  set clipboard+=unnamed
else
  set clipboard+=unnamedplus
endif
" Plugins {{{
call plug#begin('~/.vim/bundle')
Plug 'tpope/vim-rsi'

nnoremap <F5> :e!<CR>
nnoremap <F6> :MundoToggle<CR>

if !has('nvim')
Plug 'tpope/vim-sensible'
endif

Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
" Plug 'tpope/vim-vinegar'

Plug 'jeffkreeftmeijer/vim-numbertoggle'
" let g:EditorConfig_exclude_patterns = ['fugitive://.*']
Plug 'tomtom/tcomment_vim'                " Toggle comments for selected region


Plug 'sheerun/vim-polyglot'
Plug 'jparise/vim-graphql'
Plug 'radenling/vim-dispatch-neovim'
Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
nmap [c <Plug>(GitGutterPrevHunk)
nmap ]c <Plug>(GitGutterNextHunk)

" Plug 'simnalamburt/vim-mundo'
" Plug 'embear/vim-localvimrc'

" Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
"

Plug 'gioele/vim-autoswap'
" Plug 'szw/vim-maximizer', {'on': 'MaximizerToggle'}
" Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-entire'
" Plug 'kana/vim-textobj-function' | Plug 'thinca/vim-textobj-function-javascript'

" new stuff
Plug 'honza/vim-snippets'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" check this plugin again
" Plug 'Konfekt/FastFold'
" nmap zuz <Plug>(FastFoldUpdate)
" let g:fastfold_minlines = 0
" let g:fastfold_savehook = 1
" let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
" let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
"
" let g:fastfold_savehook = 1
" let g:markdown_folding = 1
" let g:tex_fold_enabled = 1
" let g:vimsyn_folding = 'af'
" let g:xml_syntax_folding = 1
" let g:javaScript_fold = 1
" let g:sh_fold_enabled= 7
" let g:ruby_fold = 1
" let g:perl_fold = 1
" let g:perl_fold_blocks = 1
" let g:r_syntax_folding = 1
" let g:rust_fold = 1
" let g:php_folding = 1

" Plug 'kkoomen/vim-doge'

" Plug 'lukhio/vim-mapping-conflicts'

Plug 'kassio/neoterm'
" if !exists('veonim')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_node_path = '/usr/local/bin/node'

"To load fzf plugin
" Plug '/usr/local/opt/fzf'
" Plug 'junegunn/fzf.vim'
" endif

let g:neoterm_default_mod='botright'
let g:neoterm_size=30
let g:neoterm_autoscroll=1
let g:neoterm_autoinsert=1
" Enable syntax highlighting for JSDoc
let g:javascript_plugin_jsdoc = 1
call plug#end() "}}}
if !has('nvim')
runtime! plugin/sensible.vim
endif
"General options "{{{
" set foldlevel=99

" let mapleader = "<space>"
map <Space> <Leader>

" Enable true color support
set termguicolors
let g:airline_theme='onedark'

try
  colorscheme onedark
catch
  colorscheme slate
endtry

set background=dark

" hi Comment ctermfg=109
" set cursorline
set hidden
set timeoutlen=500
set rnu
set showcmd
set listchars=tab:»·,nbsp:~ ",trail:¬ ,eol:$
set list
set linebreak     " when wrap is on breaks line on whole words
set title
set autowriteall     " Automatically save before commands like :next and :make
au FocusLost * :silent! wa
set noshowmode    " Show mode is useless with airline
set number        " Enable line numbers
set textwidth=120 " Max text length at 120 symbols
set shiftwidth=2 tabstop=2 expandtab
set foldmethod=manual

" set colorcolumn=121
set spelllang=en_us
" set pastetoggle=<leader>p " toggle paste mode on ,p
set backup
set backupdir=~/.tmp
set undofile
set undodir=~/.tmp
set directory=~/.tmp      " Don't clutter my dirs up with swp and tmp files
set nowrap
set wmh=0                 " Set minimal window hight, better splits
set smartindent           " add additional indents when necessary
set splitbelow
set splitright
set diffopt=filler      " display filler
set diffopt+=vertical " open diff in horizontal buffer
set diffopt+=iwhite     " ignore changes in whitespace characters
set gdefault            " add the g flat to search/replace ba default
set hlsearch            " highlight search results
set smartcase
set wildcharm=<TAB>
set wildmode=list:longest,longest:full
set completeopt=longest,menuone
set complete+=kspell "dictionary in completion but only when spell check is on "}}}
set nospell
set mouse=a
set autoread

" Plugins setup " {{{

"
let g:hardtime_maxcount = 3
let g:hardtime_allow_different_key = 1
nnoremap cot :HardTimeToggle<cr>

let g:indentLine_color_term = 239
let g:indentLine_char = '┊'
nnoremap coil :IndentLinesToggle<cr>

" let g:user_emmet_install_global = 1
" let g:user_emmet_leader_key='<C-x>'

let NERDTreeShowHidden=1  "Display hidden files on startup
let NERDTreeMinimalUI=1   "Disable bookmarks label, and hint about '?'

"}}}
" Autocmd {{{
if has("autocmd")
autocmd BufWinEnter * if line2byte(line("$") + 1) > 1000000 | syntax clear | endif
augroup FToptions
autocmd!
autocmd FileType gitcommit setlocal spell
" autocmd FileType html,css EmmetInstall
autocmd FileType html set complete+=k
autocmd FileType html set omnifunc=syntaxcomplete#Complete

augroup vimrcEx
autocmd!
autocmd BufWritePost $MYVIMRC source $MYVIMRC
autocmd BufReadPost fugitive://* set bufhidden=delete
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardTimeOn()
" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
augroup END
augroup completion
autocmd!
" autocmd   FileType   javascript        setlocal omnifunc=tern#Complete
" autocmd   FileType   javascript        setlocal foldmethod=syntax
" autocmd   FileType   json        setlocal foldmethod=syntax
autocmd   FileType   markdown          setlocal nolist wrap linebreak textwidth=78 spell
autocmd   FileType   help              nnoremap <silent><buffer> q :q<CR>
autocmd   FileType   qf              nnoremap <silent><buffer> q :q<CR>
" au CursorHold * checktime
augroup END

" set fdm=syntax fen
augroup closeCommentFolds
   au!
   " au FileType javascript %foldo | g/^\/\*/foldc
   au FileType javascript silent! g/^\/\*/foldc
augroup end
endif
"}}}
" Key maps, functions and typo corrections {{{
nnoremap <leader>v :e $MYVIMRC<CR>
nnoremap <F9> :source $MYVIMRC<cr>

" inoremap <expr><cr>  pumvisible() ? "\<c-n>" : "\<cr>"

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>

cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

"-------------------------
" Fugitive

" Blame on current line
nmap <silent> <leader>gb :.Gblame<cr>
" Blame on all selected lines in visual mode
vmap <silent> <leader>gb :Gblame<cr>
" Git status
nmap <silent> <leader>gst :Gstatus<cr>
" like git add
nmap <silent> <leader>gw :Gwrite<cr>
" git diff
nmap <silent> <leader>gd :Gdiff<cr>
" git commit
nmap <silent> <leader>gc :Gcommit<cr>
" git commit all
nmap <silent> <leader>gca :Gcommit -a<cr>
" git fixup previous commit
nmap <silent> <leader>gcf :Gcommit -a --amend<cr>
" noremap <Leader>gr :Gsearch<space>
" noremap <space>t :Tags<cr>

" command! -nargs=+ -complete=custom,s:GrepArgs Rg exe 'CocList grep '.<q-args>
"
" function! s:GrepArgs(...)
"   let list = ['-S', '-smartcase', '-i', '-ignorecase', '-w', '-word',
"         \ '-e', '-regex', '-u', '-skip-vcs-ignores', '-t', '-extension']
"   return join(list, "\n")
" endfunction

" Keymapping for grep word under cursor with interactive mode

nnoremap n nzz
nnoremap `` ``zz
" Count the number of matches of the searched word
" noremap <leader>c :%s///gn<cr>
" Copy reference
noremap <leader>yr :let @* = join([expand('%'),  line(".")], ':')<cr>

noremap g. za
noremap g/ gcc

nnoremap <silent> <leader>b :CocList mru<CR>
nnoremap <silent> <leader>p :CocList files<CR>
" nnoremap <silent> <leader>m :GitFiles<CR>
" nnoremap <silent> <leader><leader> :Buffers<cr>

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" coc config
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=1

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" restart when tsserver gets wonky
nnoremap <silent> <leader>cR  :<C-u>CocRestart<CR>
" view all errors
nnoremap <silent> <leader>cl  :<C-u>CocList locationlist<CR>


nnoremap <silent> gf :vertical wincmd F <bar> wincmd L<CR>

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> gh :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
command! -nargs=0 Prettier :CocCommand prettier.formatFile

augroup mygroup
autocmd!
" Setup formatexpr specified filetype(s).
autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
" Update signature help on jump placeholder
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" nmap <leader>ac  :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)
" Mappings using CoCList:
" Show all diagnostics.
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>ce  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>cc  :<C-u>CocList commands<cr>
" Find symbol of current document.
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>cr  :<C-u>CocListResume<CR>

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <C-d> <Plug>(coc-range-select)
" xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>gs  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
" noremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Make <tab> used for trigger completion, completion confirm, snippet expand and jump like VSCode.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" coc.nvim color changes
" hi! link CocErrorSign WarningMsg
hi! link CocWarningSign Number
hi! link CocInfoSign Type
	" make error texts have a red color
highlight CocErrorHighlight ctermfg=Red  guifg=#ff0000
hi CocErrorSign  ctermfg=Red guifg=#ff0000


nnoremap <silent> <leader>dt :NERDTreeToggle<CR>
nnoremap <silent> <leader>df :NERDTreeFind<CR>
nnoremap <silent> <c-\> :NERDTreeToggle<CR>

map <leader>w <C-w>w

if has('nvim')
tnoremap <Esc> <C-\><C-n>
" tnoremap <C-w>h <C-\><C-n><C-w>h
" tnoremap <C-w>k <C-\><C-n><C-w>k
" tnoremap <C-w>j <C-\><C-n><C-w>j
" tnoremap <C-w>l <C-\><C-n><C-w>l
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>W
tnoremap <A-k> <C-\><C-n><C-w>w
tnoremap <A-l> <C-\><C-n><C-w>l
tnoremap <A-l> <C-\><C-n><leader>w
tnoremap <M-m> <C-\><C-n>:MaximizerToggle<CR>
endif

noremap <M-l> <C-w>l
noremap <M-h> <C-w>h
noremap <M-j> <C-w>j
noremap <M-k> <C-w>k
noremap <M-.> <C-w>>
noremap <M-,> <C-w><
noremap <M-=> <C-w>+
noremap <M--> <C-w>-

nnoremap <leader>s :w<cr>
inoremap <leader>s <esc>:w<cr>

nnoremap QQ :qa!<cr>
nnoremap <C-s> :w<cr>
inoremap <C-s> <esc>:w<cr>
nnoremap <A-m> :MaximizerToggle<CR>

noremap  <C-t> <esc>:tabnew<CR>
" noremap  <A-p> <esc>:bprev<cr>
" noremap  <A-n> <esc>:bnext<cr>

noremap <Leader>q :copen<cr><cr>
" nmap <S-CR> O<Esc>
nnoremap <CR> o<Esc>
"to be consistent with C and D
nnoremap Y y$
" select text just pasted
noremap gV `[v`]

" alternative to <C-]>
" place your cursor on an id or class and hit <leader>]
" to jump to the definition
" nnoremap <leader>] :tag /\(<c-r>=expand('<cword>')<cr>\|<c-r>=<SID>SimeSubstitute()<cr>\)
" nnoremap <leader>] :tag /\(<c-r>=expand('<cword>')<cr>\)\|mongooseerror/<cr>
nnoremap <leader>] :tag /<c-r>=expand('<cword>')<cr>\\\|<c-r>=<SID>SimeSubstitute()<cr><cr>
" alternative to <C-w>}
" place your cursor on an id or class and hit <leader>}
" to show a preview of the definition. This doesn't seem to be
" very useful for CSS but it rocks for JavaScript
" nnoremap <leader>} :ptag /\(<c-r>=expand('<cword>')<cr>\)\|\(<c-r>=<SID>SimeSubstitute()<cr>\)<cr><cr>
nnoremap <leader>} :ptag /\(<c-r>=<SID>SimeSubstitute()<cr>\)<cr>
function! s:SimeSubstitute()
let temp = expand('<cword>')
let ret = substitute(temp, '[-.]', '', 'g')
return ret
endfunction

" allows incsearch highlighting for range commands
" cnoremap <tab>t <CR>:t''<CR>
" cnoremap <tab>T <CR>:T''<CR>
" cnoremap <tab>m <CR>:m''<CR>
" cnoremap <tab>M <CR>:M''<CR>
" cnoremap <tab>d <CR>:d<CR>``
" Stupid shift key fixes
command! -bang -nargs=* -complete=file E e<bang> <args>
command! -bang -nargs=* -complete=file W w<bang> <args>
command! -bang -nargs=* -complete=file Wq wq<bang> <args>
command! -bang -nargs=* -complete=file WQ wq<bang> <args>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Q q<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>

function! s:VSetSearch()
let temp = @s
norm! gv"sy
let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
let @s = temp
endfunction
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

nnoremap <leader>to :Topen<cr>
nnoremap <leader>tc :Tclose<cr>
tnoremap <leader>tc <C-\><C-n>:Tclose<cr>


nnoremap <Left> :vertical resize +2<CR>
nnoremap <S-Left> :vertical resize +10<CR>
nnoremap <Right> :vertical resize -2<CR>
nnoremap <S-Right> :vertical resize -10<CR>
nnoremap <Up> :resize +2<CR>
nnoremap <S-Up> :resize +10<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <S-Down> :resize -10<CR>


try
" === Vim airline ==== "
" Enable extensions
let g:airline_extensions = ['branch', 'hunks', 'coc']
"
" Update section z to just have line number
let g:airline_section_z = airline#section#create(['linenr'])
"
" Do not draw separators for empty sections (only for the active window) >
let g:airline_skip_empty_sections = 1
"
" Smartly uniquify buffers names with similar filename, suppressing common parts of paths.
let g:airline#extensions#tabline#formatter = 'unique_tail'
"
" Custom setup that removes filetype/whitespace from default vim airline bar
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'z', 'warning', 'error']]
"
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
"
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
"
" Configure error/warning section to use coc.nvim
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
"
" Hide the Nerdtree status line to avoid clutter
let g:NERDTreeStatusline = ''
"
" Disable vim-airline in preview mode
let g:airline_exclude_preview = 1
"
" Enable powerline fonts
let g:airline_powerline_fonts = 1
"
" Enable caching of syntax highlighting groups
let g:airline_highlighting_cache = 1

" Define custom airline symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" Don't show git changes to current file in airline
let g:airline#extensions#hunks#enabled=0

catch
  echo 'Airline not installed. It should work after running :PlugInstall'
endtry


if has('nvim')
  let $GIT_EDITOR = 'nvr -cc split --remote-wait'
endif
autocmd FileType gitcommit,gitrebase,gitconfig set bufhidden=delete


"Fzf setup
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

nnoremap <silent> <Leader>gr :exe 'RG '.expand('<cword>')<CR>
