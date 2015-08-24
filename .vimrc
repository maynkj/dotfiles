" Vim configuration.

set nocompatible                  " Must come first because it changes other options.

syntax enable                     " Turn on syntax highlighting.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set hls                           " Highlight matches.
set hlsearch                      " Highlight matches.

set nowrap                        " don't wrap lines
set scrolloff=3                   " Show 3 lines of context around the cursor.

set nrformats=                    " Treat all numerals as decimals

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set noswapfile                    " Don't save swap files.

set tabstop=2                     " Global tab width.
set shiftwidth=2                  " And again, related.
set expandtab                     " Use spaces instead of tabs.

set autoindent                    " Auto indent.

set laststatus=2                  " Show the status line all the time.
set statusline=%y\ %f\ %=\ TL:\ %L

set encoding=utf-8 fileencodings=.

set runtimepath^=~/.vim/bundle/ctrlp.vim

" Tab mappings.
let mapleader=","

augroup vimrcEx
  "clear all autocmds in the group.
  autocmd!
  autocmd FileType ruby,css,html,javascript setlocal ai tabstop=2 shiftwidth=2 softtabstop=2 expandtab

  autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
  autocmd FileType c,make,lua setlocal tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab
  autocmd FileType rc setlocal tabstop=8 shiftwidth=8 softtabstop=8 noexpandtab

  autocmd! BufRead,BufNewFile *.rc setlocal filetype=rc
  autocmd! BufRead,BufNewFile *.raml setlocal filetype=raml
  autocmd! BufRead,BufNewFile *.less setlocal filetype=less
  autocmd! BufRead,BufNewFile *.md setlocal filetype=markdown

  " Leave the return key alone when in command line windows, since it's used
  " to run commands there.
  autocmd! CmdwinEnter * :unmap <cr>
  autocmd! CmdwinLeave * :call MapCR()

  " Removing all trailing whitespace.
  autocmd BufWritePre * :%s/\s\+$//e
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLORSCHEME
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
colorscheme hemisu

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FILE FINDER
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_user_command = [".git/", "git --git-dir=%s/.git ls-files -oc --exclude-standard"]

" Returns files from the git index.
function! ListGitFiles(...)
  return system("git ls-files")
endfunction

com! -complete=custom,ListGitFiles -nargs=1 E :e <args>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
  let old_name = expand("%:p")
  let new_name = input("New file name: ", expand("%"), "file")

  if new_name != ""
    exec ":saveas " . new_name
    exec ":silent !rm " . old_name
    redraw!
  endif
endfunction

map <leader>n :call RenameFile()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
  let col = col(".") - 1

  if !col || getline(".")[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper()<cr>
