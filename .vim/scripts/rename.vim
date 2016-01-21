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
