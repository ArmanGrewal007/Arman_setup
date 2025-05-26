call plug#begin('~/.vim/plugged')

" IDE Core Features
Plug 'neoclide/coc.nvim', {'branch': 'release'}  " LSP/autocomplete
Plug 'preservim/nerdtree'                        " File explorer
Plug 'ctrlpvim/ctrlp.vim'                        " Fuzzy file finder
Plug 'dense-analysis/ale'                        " Linter
Plug 'tpope/vim-fugitive'                        " Git integration
Plug 'majutsushi/tagbar'                         " Code structure sidebar
Plug 'ryanoasis/vim-devicons'                    " Icons (requires Nerd Font)

" Optional Enhancements
Plug 'jiangmiao/auto-pairs'                      " Auto-close brackets
Plug 'tpope/vim-commentary'                      " Comment toggling
Plug 'vim-airline/vim-airline'                   " Status bar
Plug 'Yggdroot/indentLine'                       " Indentation guides

call plug#end()


" basics
syntax on
" let g:netrw_browse_split = 4
autocmd BufRead,BufNewFile *.conf setfiletype conf
" Relative numbers in normal mode, absolute numbers in insert mode
set number relativenumber
augroup NumberToggle
  autocmd!
  autocmd InsertEnter * set norelativenumber
  autocmd InsertLeave * set relativenumber
augroup END

" Use TAB for completion
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Go-to definition/references
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <leader>rn <Plug>(coc-rename)

" LSP diagnostics
nnoremap <silent> <leader>d :CocDiagnostics<CR>

nnoremap <C-n> :NERDTreeToggle<CR>
command! Ntt NERDTreeToggle
let NERDTreeShowHidden=1  " Show hidden files

" Define a function that opens the file under the cursor in NERDTree
function! NERDTreeAutoOpen()
  " Check if we're in a NERDTree buffer
  if exists("b:NERDTreeRootNode")
    " Get the selected node (file or directory)
    let l:node = b:NERDTreeRootNode.getSelectedNode()
    " If a node is selected, is not a directory, and has a valid path
    if l:node && !l:node.isDirectory() && !empty(l:node.path.str())
      " Open the file in the main window
      execute 'edit ' . l:node.path.str()
    endif
  endif
endfunction

" Set up an autocommand for NERDTree buffers to trigger on CursorHold
autocmd FileType nerdtree autocmd CursorHold <buffer> call NERDTreeAutoOpen()

