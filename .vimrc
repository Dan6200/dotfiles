"TODO: Read and experiment with coc settings in this file
"cspell:disable
set dict+=/home/darealestniqqa/dict/words
set cmdheight=2
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
set go=d
set relativenumber
set number
set tabstop=4
set softtabstop=0
set noexpandtab
set smarttab
set shiftwidth=4
set smartindent
set wrap
set linebreak
set nohlsearch
set incsearch
set autoindent
set mouse=a
set noeb
set novisualbell
set t_vb=
set wildmode=longest,list,full
set wildmenu
set hidden
set listchars=eol:$,tab:>->,trail:~,extends:>,precedes:<,space:.			" shows all whitespace and invisible characters when paired with :set list
set ttimeout
set updatetime=300
set ttimeoutlen=500
set timeoutlen=500
set showcmd
set breakindent
set breakindentopt=shift:4,min:40,sbr
set showbreak=>
syntax on
noremap <Up> :tabprev<cr>
noremap <Down> :tabnext<cr>
noremap <Left> <NOP>
noremap <Right> <NOP>
noremap <BS> <NOP>
map [[ ?{<CR>w99[{
map ][ /}<CR>b99]}
map ]] j0[[%/{<CR>
map [] k$][%?}<CR>
set undodir=~/.vim/undodir
set undofile
let mapleader= "\\"
packadd! matchit
set showmatch
call plug#begin('~/.vim/plugged')
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'
Plug 'digitaltoad/vim-pug'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'leafgarland/typescript-vim'
Plug 'https://github.com/joshdick/onedark.vim.git'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dNitro/vim-pug-complete', { 'for': ['jade', 'pug'] }
Plug 'sickill/vim-monokai'
Plug 'rakr/vim-one'
Plug 'evanleck/vim-svelte'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-fugitive'
Plug 'puremourning/vimspector'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()
" colo monokai
colo onedark

" air-line
let g:airline_theme = 'onedark'
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
" let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.colnr = ' ㏇:'
" let g:airline_symbols.colnr = ' ℅:'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = ' ㏑:'
" let g:airline_symbols.linenr = ' ☰ '
" let g:airline_symbols.linenr = ' ␊:'
" let g:airline_symbols.linenr = ' ␤:'
" let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
" let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
" let g:airline_symbols.colnr = ' :'
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ' :'
" let g:airline_symbols.maxlinenr = '☰ '
" let g:airline_symbols.dirty='⚡'

" tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''


set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes

""""""""""""""""""""""""""""""""""""""""""""""" coc settings & remappings""""""""""""""""""""""""""""""""""""""""""""""


" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction)
nmap <leader>ad  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

au BufEnter,BufNew *.ts,*.js,*.tsx,*.jsx call SetTSOptions()
fu SetTSOptions ()
	set mp=tsc\ -p\ ~/Documents/dev_work/thrift/server/src/tsconfig.json
	nmap [t :$tab ter++shell cd ~/Documents/dev_work/thrift && yarn test<cr>
	nmap ]t :$tabc<cr>
	nmap [r :ter++shell ~/Documents/dev_work/thrift && yarn run dev<cr>
endfu
au BufEnter,BufNew *.py call SetPYOptions()
fu SetPYOptions ()
	set mp='python3\ %'
endfu
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" a plugin is messing with this key
nmap \ \

map <C-h> <C-t>
set wildignore+=*/tmp/*                                     " ctrl p - ignore files in tmp directories
set wildignore+=*/target/*                                  " ctrl p - ignore files in target directories
set wildignore+=*/build/*                                   " ctrl p - ignore gradle build directories
set wildignore+=*/built/*                                   " ctrl p - ignore gradle build directories
set wildignore+=*.so                                        " ctrl p - ignore .so files
set wildignore+=*.o                                         " ctrl p - ignore .o files
set wildignore+=*.class                                     " ctrl p - ignore .class files
set wildignore+=*.swp                                       " ctrl p - ignore .swp files
set wildignore+=*.zip                                       " ctrl p - ignore .zip files
set wildignore+=*.pdf                                       " ctrl p - ignore .pdf files
set wildignore+=*/node_modules/*                            " ctrl p - ignore node modules
set wildignore+=*/bower_components/*                        " ctrl p - ignore bower components
set wildignore+=*/dist/*                                    " ctrl p - ignore grunt build director
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
nnoremap <C-f><C-f> :NERDTreeToggle<cr>
nnoremap <C-f> :NERDTreeFocus<cr>
nnoremap <C-f><C-w> :NERDTreeCWD<cr>
nnoremap <C-f><C-d> :NERDTreeFind<cr>
let g:NERDTreeMapHelp = '<F2>'
let g:NERDTreeMapQuit = '<F12>'
"
"
""""""""""""""""""""" Vimspector Shortcuts """"""""""""""""""""
"
nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>de :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>

nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>

nmap <Leader>dk <Plug>VimspectorRestart
nmap <Leader>dh <Plug>VimspectorStepOut
nmap <Leader>dl <Plug>VimspectorStepInto
nmap <Leader>dj <Plug>VimspectorStepOver
"u
let g:vimspector_base_dir='/home/darealestniqqa/.vim/plugged/vimspector'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"fix colo scheme for coc nvim selection box"
if  g:colors_name == 'onedark' 
	highlight CocMenuSel ctermbg=4  
endif
" vim markdown 
let g:vim_markdown_new_list_item_indent = 0

" vim-go
" ======

let g:go_fmt_command = "goimports"

" Autosave
" ========

let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
"
"
"
"
" Personal Mappings
map [q 2o<ESC>
map ]q 2O<ESC>
map [o o<ESC>
map ]o O<ESC>
map [a :w<CR>
nmap <space>b :Buffer<cr>
nnoremap - @:
nnoremap ' `
nnoremap <Space>C :Commits<cr>
map <C-J> :bn<CR>
map <C-K> :bp<CR>
map [f :cn<CR>
map ]f :cp<CR>
nmap <leader>x :so $MYVIMRC<cr>:e<cr>
nmap <leader>X :so $MYGVIMRC<cr>:e<cr>
nnoremap <leader>cd :call fzf#run({'source': 'find . -type d -print', 'sink': 'cd'})<cr>
nnoremap <leader>CD :call fzf#run({'source': 'find ~ -type d -print', 'sink': 'cd'})<cr>
nnoremap <leader>f :Files<cr>
nnoremap <leader>g :GFiles<cr>
nnoremap <leader>ed :call fzf#run({'source': 'find . -type d -print', 'sink': 'e'})<cr>
nnoremap <leader>cw :cd %:h<cr>
nnoremap <leader>r :Rg<cr>
nnoremap <leader>rg :Rg <C-R><C-W><CR>
nmap <leader>H :cd ~/Documents/dev_work/thrift<cr>
" search for visually selected text with //
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
nnoremap [x :bd
nnoremap [X :qa
nnoremap <leader>q :make<cr>
nnoremap <C-p> <C-b>
nnoremap <C-n> <C-f>
nnoremap [e /\cerror<cr>
nnoremap [p :ter++shell ++close gitpush<cr>
nnoremap )P :ter++shell ++close gitcommit<cr>
"Command for quicker vimgrep searches
command! -nargs=1 Vimgrep vimgrep /<args>/ **/*
" convenient mapping
nnoremap <space>V :Vimgrep 
"nnoremap <leader>f :call fzf#run({'source': 'find -L -print', 'sink': 'e'})<cr>

" Find a better way to comment...
map <F3> {i/*<Esc>O<Esc>))o*/<Esc>
map <F4> (dd/\*\/<CR>dd
"""""""""""""
map <F5> i`<Esc>Ea`<Esc>
map <F6> i"<Esc>Ea"<Esc>
map <F7> i'<Esc>Ea'<Esc>
nmap :: q:
" j, k          Store relative line number jumps in the jumplist.
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'j'
"
" terminal mappings
"
tmap <C-e> N
