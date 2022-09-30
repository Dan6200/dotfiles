"TODO: Read and experiment with coc settings in this file
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
set showbreak=>>
syntax on
noremap <Up> :prev<cr>
noremap <Down> :n<cr>
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
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'
Plug 'digitaltoad/vim-pug'
Plug 'neoclide/coc.nvim'
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
Plug 'evanleck/vim-svelte'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-obsession'
call plug#end()
colo monokai

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
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

" Mappings
map [q O<ESC>
map ]q o<ESC>
map [a :w<CR>
nnoremap ' `
map <C-J> :bn<CR>
map <C-K> :bp<CR>
map [f :cn<CR>
map ]f :cp<CR>
nmap <leader>x :w<cr>:so $MYVIMRC<cr>:e<cr>
nmap <F9> :Buffer<cr>
nnoremap <leader>cd :cd<cr>:call fzf#run({'source': 'find . -type d -print', 'sink': 'cd'})<cr>
nnoremap <leader>f :Files<cr>
nnoremap <leader>ed :call fzf#run({'source': 'find . -type d -print', 'sink': 'e'})<cr>

" Find a better way to comment...
map <F3> {i/*<Esc>O<Esc>))o*/<Esc>
map <F4> (dd/\*\/<CR>dd
map <F5> i`<Esc>ea`<Esc>
map <F6> i"<Esc>ea"<Esc>
map <F7> i'<Esc>ea'<Esc>
nmap :: q:
" j, k          Store relative line number jumps in the jumplist.
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'j'
"
" terminal mappings
"
tmap <C-e> N

" coc settings & remappings
set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>F  <Plug>(coc-format-selected)
nmap <leader>F  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>d  <Plug>(coc-codeaction-selected)
nmap <leader>d  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>do  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
nmap [gd <Plug>(coc-definition)
nmap [gy <Plug>(coc-type-definition)
nmap [gr <Plug>(coc-references)
nmap [g <Plug>(coc-diagnostic-prev)
nmap ]g <Plug>(coc-diagnostic-next)
au BufEnter,BufNew *.ts,*.js,*.tsx,*.jsx call SetTSOptions()
fu SetTSOptions ()
	set mp='npx\ tsc\ -p\ $*'
	nmap [t :$tab ter yarn test<cr>
	nmap ]t :$tabc<cr>
	nmap [r :tab ter yarn run dev<cr>
endfu
au BufEnter,BufNew *.py call SetPYOptions()
fu SetPYOptions ()
	set mp='python3\ %'
endfu

" a plugin is messing with this key
nmap \ \

map <C-h> <C-t>
set wildignore+=*/tmp/*                                     " ctrlp - ignore files in tmp directories
set wildignore+=*/target/*                                  " ctrlp - ignore files in target directories
set wildignore+=*/build/*                                   " ctrlp - ignore gradle build directories
set wildignore+=*/built/*                                   " ctrlp - ignore gradle build directories
set wildignore+=*.so                                        " ctrlp - ignore .so files
set wildignore+=*.o                                         " ctrlp - ignore .o files
set wildignore+=*.class                                     " ctrlp - ignore .class files
set wildignore+=*.swp                                       " ctrlp - ignore .swp files
set wildignore+=*.zip                                       " ctrlp - ignore .zip files
set wildignore+=*.pdf                                       " ctrlp - ignore .pdf files
set wildignore+=*/node_modules/*                            " ctrlp - ignore node modules
set wildignore+=*/bower_components/*                        " ctrlp - ignore bower components
set wildignore+=*/dist/*                                    " ctrlp - ignore grunt build director
" search for visually selected text with //
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
let ROOT='~/Documents/dev_work/thrift'
fu TA()
	nnoremap <leader>cd :exec 'cd' ROOT<cr>:call fzf#run({'source': 'find . -type d -print', 'sink': 'cd'})<cr>
endfu 
nnoremap <C-f><C-f> :NERDTreeToggle<cr>:set relativenumber<cr>
nnoremap <C-f> :NERDTreeFocus<cr>:set relativenumber<cr>
nnoremap <C-f><C-w> :NERDTreeCWD<cr>:set relativenumber<cr>
nnoremap <C-f><C-d> :NERDTreeFind<cr>:set relativenumber<cr>
nnoremap [x :bd
nnoremap <leader>q :make<cr>
nnoremap <C-p> <C-b>
nnoremap <C-n> <C-f>
nnoremap [e /\cerror<cr>
nnoremap [p :tab ter++close sh gitpush.sh<cr>
