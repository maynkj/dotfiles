if exists("did_load_filetypes")
  finish
end

augroup vimrcEx
  au! FileType rc setlocal ai ts=4 sw=4 sts=4 et
  au! FileType make setlocal noet

  " Markdown
  au! BufNewFile,BufRead *.markdown,*.md setf markdown

  " Mote
  au! BufNewFile,BufRead *.mote setf mote

  " Rc
  au! BufNewFile,BufRead *.rc,.rcrc* setf rc

  " Removing all trailing whitespace.
  au! BufWritePre * :%s/\s\+$//e
augroup END
