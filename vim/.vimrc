set nocompatible
set number
set relativenumber

set hlsearch
let @/ = ""

set expandtab
set ts=2
set sw=2

syntax on
filetype plugin indent on

set laststatus=2
set showcmd


" Remaps
" Explicitly set the Leader to comma. You can use '\' (the default)
let mapleader=' '

" Reload the vimrc
nnoremap <leader>RR :source ~/.vimrc<CR>

" Open file explorer
nnoremap <leader>fv :Explore<CR>

" Automatically change the working path to the path of the current file
autocmd BufNewFile,BufEnter * silent! lcd %:p:h

" use » to mark Tabs and ° to mark trailing whitespace. This is a
" non-obtrusive way to mark these special characters.
set list listchars=tab:»\ ,trail:°

" util function to check hostname
function! IsOnSomeParticularMachine(hostname)
  return hostname() == a:hostname
endfunction

" Google specific plugins only on gLinux
if IsOnSomeParticularMachine("abhistract.c.googlers.com")
  " Load the default google configuration and install Glug
  source /usr/share/vim/google/google.vim

  " :PiperSelectActiveFiles comes by default from google.vim. It's so useful that
  " we map it to <leader>p (i.e., ,p).
  noremap <leader>p :PiperSelectActiveFiles<CR>

  " Load the blaze plugins, with the ,b prefix on all commands.
  " Since we've set the mapleader to ',' above, this should be ,bb in practice
  Glug blaze plugin[mappings]='<leader>b'

  " See go/ycm for more details.
  Glug youcompleteme-google

  Glug codefmt
  Glug codefmt-google

  augroup autoformat
    autocmd!
    " Autoformat BUILD files on write.
    autocmd FileType bzl AutoFormatBuffer buildifier
    " Autoformat go files on write.
    autocmd FileType go AutoFormatBuffer gofmt
    " Autoformat proto files on write.
    autocmd FileType proto AutoFormatBuffer clang-format
    " Autoformat c and c++ files on write.
    autocmd FileType c,cpp AutoFormatBuffer clang-format
  augroup END

  Glug g4

  Glug relatedfiles
  nnoremap <leader>rf :RelatedFilesWindow<CR>

  " Enable the corpweb plugin, which allows us to open codesearch from vim
  Glug corpweb
  " search in codesearch for the word under the cursor
  nnoremap <leader>csw :CorpWebCs <cword> <CR>
  " search in codesearch for the current file
  nnoremap <leader>csf :CorpWebCsFile<CR>

  " Load the Critique integration. Use :h critique for more details
  Glug critique

  " Load google-internal checkers for Syntastic
  Glug syntastic-google
endif

if IsOnSomeParticularMachine("Abhinavs-MacBook-Air.local")
    set showmode

    " Wildmenu settings
    set wildmenu
    set wildmode=list:longest

    set smartindent
    set smarttab
    set sw=4
    set ts=4
    set softtabstop=4
    set nofoldenable
    set scrolloff=8

    set incsearch

    nmap <leader>bb <c-^><cr>
    inoremap jj <ESC>
endif
