call plug#begin('~/AppData/Local/nvim/autoload')

	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'junegunn/fzf.vim'
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'jeffkreeftmeijer/vim-numbertoggle'
	Plug 'Yggdroot/indentLine'
  Plug 'othree/html5.vim', { 'for': 'html' }	
	Plug 'jiangmiao/auto-pairs'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-commentary'               " Comment stuff out
  Plug 'ryanoasis/vim-devicons'
  Plug 'mhinz/vim-startify'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Plug 'SirVer/ultisnips'         " Track the engine.
  Plug 'honza/vim-snippets'             " Snippets are separated from the engine. Add this if you want them:
  Plug 'majutsushi/tagbar'
  Plug 'universal-ctags/ctags'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'flrnprz/plastic.vim' "Tema 
	Plug 'shaunsingh/moonlight.nvim'
	Plug 'NLKNguyen/papercolor-theme'
	Plug 'tomlion/vim-solidity'
	Plug 'sbdchd/neoformat'
	Plug 'luochen1990/rainbow'
	Plug 'sainnhe/gruvbox-material'
	Plug 'preservim/nerdtree'
	Plug 'scrooloose/nerdtree'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' } 
	Plug 'tribela/vim-transparent'
	Plug 'caenrique/nvim-toggle-terminal'
	"Plug 'wfxr/minimap.vim'
	Plug 'severin-lemaignan/vim-minimap'

call plug#end()

syntax on                   " syntax highlighting
set ruler
set mouse=v                 " middle-click paste with 
set mouse=a                 " enable mouse click
set number
set wildmenu                                "Visual autocimplete for cammand menu
set hlsearch                " highlight search 
set incsearch               " incremental search
set splitright                              "Open new split panes to right and below
set splitbelow
set tabstop=2                               " 4 whitespaces for tabs visual presentation
set autoindent                              " indent when moving to the next line while writing code
set showmatch             " shows matching part of bracket pairs (), [], {}
set noswapfile            " disable creating swap file
set shiftwidth=2                            " shift lines by 4 spaces
set scrolloff=30                            " let 10 lines before/after cursor during scroll
set termguicolors          " Activa true colors en la terminal
set encoding=utf-8          "Utf-8 by default
set relativenumber				 " Relative line numbers.
set background=dark   			" dark or light
set guicursor=i:ver1       "Enable vertical cursor when in insert mode
set guicursor+=a:blinkon1  "Enable cursor blinking
set title
set nocompatible
set clipboard=unnamedplus   " using system clipboard
set ttyfast                 " Speed up scrolling in Vim
"set termguicolors
" colorscheme plastic
" colorscheme PaperColor
" colorscheme moonlight
" colorscheme evening
colorscheme gruvbox-material

let mapleader = " "


" INTEND LINE " NO MOSTRAR EN CIERTOS TIPOS DE BUFFERS Y ARCHIVOS

let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal']
let g:indentLine_bufNameExclude = ['NERD_tree.*', 'term:.*']
let delimitMate_expan_cr = 2
let g:gruvbox_material_background='medium'
let g:lightline = { 'colorscheme': 'plastic' }

" NERDTree

"let g:NERDTreeShowHidden = 1 			"0 no permite ver los archivos ocultos.
"let g:NERDTreeMinimalUI = 1 			"Esconde la ayuda.
"let g:NERDTreeStatusline = '' 		"let g:NERDTreeIgnore = []
"Auto open NERDTree.
"autocmd VimEnter * NERDTree "Inicio automatico de nerdtree "Primera opción"
"augroup nerdtree_open
"	autocmd!
"	autocmd VimEnter * NERDTree | wincmd p
"augroup END
map <C-n> :NERDTreeToggle<CR>
" Create default mappings
" let g:NERDCreateDefaultMappings = 1 "Create defult mappings
" let g:NERDSpaceDelims = 1 "Add spaces after comment delimiter by default"
" let g:NERDCompactSexyComs = 1 "Use compact syntax for prettified multi-line comments"
" let g:NERDDefaultAlign = 'left' "Align line-wise comment delimiter flush left instead of following code indentatio
" " Set a language to use its alternate delimiters by default Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" " Allow commenting and inverting empty lines (useful when commenting a region)
" let g:NERDCommentEmptyLines = 1
" " Enable trimming of trailing whitespace when uncommenting
" let g:NERDTrimTrailingWhitespace = 1
" " Enable NERDCommenterToggle to check all selected lines is commented or not 
" let g:NERDToggleCheckAllLines = 1

nmap <F9> :bprev<CR>
nmap <F10> :bnext<CR>
nmap <silent> <leader>q :SyntasticCheck # <CR> :bp <BAR>db #<CR>

" TAGBAR CONFIGURATION

"nmap <F8> :TagbarToggle<CR>
nnoremap <silent> <C-T> :TagbarOpen<CR>
nnoremap <silent> <C-C> :TagbarClose<CR>
autocmd FileType python,c,cpp,sol,html,css TagbarOpen

" VIM JUMP TO THE LAST POSITION WHEN REOPENING A FILE
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" FIND FILES USING TELESCOPE COMMAND-LINE SUGAR.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


" FORMAT

autocmd BufWritePre *.js Neoformat
let g:neoformat_try_node_exe = 1


" COLOR BRACKET

let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle


" PANES

" MOVE LINE OR VISUALLY SELECTED BLOCK - ALT+J/K
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" MOVE SPLIT PANES TO LEFT/BOTTOM/TOP/RIGHT
nnoremap <A-h> <C-W>H
nnoremap <A-j> <C-W>J
nnoremap <A-k> <C-W>K
nnoremap <A-l> <C-W>L

" MOVE BETWEEN PANES TO LEFT/BOTTOM/TOP/RIGHT
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" PRESS I TO ENTER INSERT MODE, AND II TO EXIT INSERT MODE.
:inoremap ii <Esc>
" :inoremap jk <Esc>
" :inoremap kj <Esc>
" :vnoremap jk <Esc>
" :vnoremap kj <Esc>



"set laststatus = 2  " Display the status line always. Advantage of havin the status line always is, you can see the current mode, fine name, file status, ruler, etc
"set g:tagbar_ctags_bin 
"set hidden
"set smarttab                                " set tabs for a shifttabs logic
"set expandtab                               " expand tabs into spaces
"set cursorcolumn                              " Show line for column
"set nobackup 	                            " no backup files
"set nocompatible            " disable compatibility to old-time vi
"set ignorecase       i       " case insensitive 
"set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
"set wildmode=longest,list   " get bash-like tab completions
"set cc=80                  " set an 80 column border for good coding style
" filetype plugin indent on   "allow auto-indenting depending on file type
" filetype plugin on
" set spell                 " enable spell check (may need to download language package)
" set backupdir=~/.cache/vim "Directory to store backup files.
" set nowritebackup                           " only in case you don't want a backup file while editing
" set backspace=indent,eol,start              " backspace removes all (indents, EOLs, start) What is start?
" set clipboard=unnamed                       " use system clipboard
" set exrc                                    " enable usage of additional .vimrc files from working directory
" set secure                                  " prohibit .vimrc files to execute shell, create files, etc...
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some unicode characters in the
" file autoload/float.vim TextEdit might fail if hidden is not set. Give more space for displaying messages.
" set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
" set updatetime=300
" Don't pass messages to |ins-completion-menu|.
" set shortmess+=c
 
" Always show the signcolumn, otherwise it would shift the text each time diagnostics appear/become resolved. 
if has("nvim-0.5.0") || has("patch-8.1.1564") "Recently vim can merge signcolumn and number column into one
set signcolumn=number
else
  set signcolumn=yes
endif

highlight Visual guifg=#ffffcc guibg=#FD971F      "Visual Mode Orange Background, Black Text
" highlight CursorColumn ctermfg=White ctermbg=LightGray cterm=bold guifg=white guibg=#202020 gui=bold
" highlight Cursor ctermfg=White ctermbg=black cterm=bold guifg=white guibg=#202020 gui=bold
" highlight CursorLine guibg=#3E3D32                "Default Colors for CursorLine
" highlight Cursor guibg=#A6E22E;

" autocmd InsertEnter * highlight  CursorLine guibg=#323d3e   "Change Color when entering Insert Mode
" autocmd InsertEnter * highlight  Cursor guibg=#00AAFF;
" autocmd InsertLeave * highlight  CursorLine guibg=#3e3d32   "Revert Color to default when leaving Insert Mode
" autocmd InsertLeave * highlight  Cursor guibg=#A6E223
" augroup vimrc_autocmds
"   autocmd!
"   autocmd FileType python,rst,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
"   autocmd FileType python,rst,c,cpp match Excess /\%81v.*/
"   autocmd FileType python,rst,c,cpp set nowrap
"   autocmd FileType python,rst,c,cpp set colorcolumn=80
" augroup END


" nnoremap gf :vert winc f<cr>
" open file in a text by placing text and gf
" copies filepath to clipboard by pressing yf
"nnoremap <silent> yf :let @+=expand('%:p')<CR>
" copies pwd to clipboard: command yd
":nnoremap <silent> yd :let @+=expand('%:p:h')<CR>
" nnoremap <C-p> :FZF<CR>
" Color Schemes
" if(has("termguicolors"))
"   set termguicolors
" endif


"	ULTISNIPS +++++++++ por verificar ++++++++++++

" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" let g:UltiSnipsEditSplit="vertical       "If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsListSnippets="<c-l>"
" let g:UltiSnipsSnippetsDir="C:/Users/jmachuca/AppData/Local/nvim/autoload/vim-snippets/UltiSnips"
" let g:UltiSnipsSnippetDirectories=["UltiSnips", "snips"]
" let g:UltiSnipsEditSplit= "context
" set rtp+=~/Users/jmachuca/AppData/Local/nvim/autoload/vim-snippets/UltiSnips


" USE TAB FOR TRIGGER COMPLETION WITH CHARACTERS AHEAD AND NAVIGATE.
" NOTE: USE COMMAND ':VERBOSE IMAP <TAB>' TO MAKE SURE TAB IS NOT MAPPED BY
" OTHER PLUGIN BEFORE PUTTING THIS INTO YOUR CONFIG.
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" USE <C-SPACE> TO TRIGGER COMPLETION.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
	inoremap <silent><expr> <c-@> coc#refresh()
endif

" MAKE <CR> AUTO-SELECT THE FIRST COMPLETION ITEM AND NOTIFY COC.NVIM TO FORMAT ON ENTER, <CR> COULD BE REMAPPED BY OTHER VIM PLUGIN
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" USE K TO SHOW DOCUMENTATION IN PREVIEW WINDOW.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
 if (index(['vim','help'], &filetype) >= 0)
   execute 'h '.expand('<cword>')
 elseif (coc#rpc#ready())
   call CocActionAsync('doHover')
 else
   execute '!' . &keywordprg . " " . expand('<cword>')
 endif
endfunction


" HIGHLIGHT THE SYMBOL AND ITS REFERENCES WHEN HOLDING THE CURSOR.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` "to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Applying codeAction to the selected region. example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" Map function and class text objects nOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
" Use CTRL-S for selections ranges. Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap <C-f> and <C-b> for scroll float windows/popups.
" if has('nvim-0.4.0') || has('patch-8.2.0750')
"   nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"   inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"   inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"   vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
" endif

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
" Add (Neo)Vim's native statusline support.
" nOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
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

" HABILITAR TRANSPARENCIAS DE NEOVIM DESDE EL CÓDIGO.
" let g:transparent_enabled = v:false

" Toggle terminal 
" let g:toggleTerm_terminal_mapping = '<C-}>'
" nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
" inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>
"

" Terminal caenrique / nvim-toggle-terminal
nnoremap <silent> <C-z> :ToggleTerminal<Enter>
tnoremap <silent> <C-z> <C-\><C-n>:ToggleTerminal<Enter>

" MINIMAP
" let g:minimap_width = 10
" let g:minimap_auto_start = 1
" let g:minimap_auto_start_win_enter = 1
" let g:minimap_highlight='Visual'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_powerline_fonts = 1


" COMMAND TO OPEN INIT.VIM
command! Einit edit /home/josman/.config/nvim/init.vim





