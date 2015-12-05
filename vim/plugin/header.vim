" Vim File
" AUTHOR:   Agapo (fpmarias@google.com)
" FILE:     /usr/share/vim/vim70/plugin/header.vim
" CREATED:  21:06:35 05/10/2004
" MODIFIED: 2013-05-16 14:22:11
" TITLE:    header.vim
" VERSION:  0.1.3
" SUMMARY:  When a new file is created a header is added on the top too.
"           If the file already exists, the pluging update the field 'date of
"           the last modification'.
" INSTALL:  Easy! Copy the file to vim's plugin directory (global or personal)
"           and run vim.


" FUNCTION:
" Insert the header when we create a new file.
" VARIABLES:
" author = User who create the file.
" file = Path to the file.
" created = Date of the file creation.
" modified = Date of the last modification.

function s:insert ()

  let s:comment = "\/*"
  let s:start = s:comment . " ************************************************************************** *\/"
  let s:empty = s:comment . "                                                                            *\/"
  let s:top42 = s:comment . "                                                         :::    ::::::::    *\/"
  let s:file = s:comment .      "  ".expand("<afile>:t")
  let s:belowFile = "\/*                                                     +:+ +:+       +:+      *\/"
  let s:author = s:comment .    "  By:  " . $USER . " <". $MAIL .">" 
  let s:mid = "\/*                                                 \+\#\+\#\+\#\+\#\+\#\+\ \+\#\+           *\/"
  let s:created = s:comment .  "  Created: " . strftime ("%Y/%m/%d %H/%M/%S") . " by " . $USER . " \#\+\#    \#\+\#             *\/"
  let s:modified = s:comment .  "  Updated: " . strftime ("%Y/%m/%d %H/%M/%S")  . " by " . $USER . "\#\#\#   \#\#\#\#\#\#\#\#.fr       *\/"
  let s:end = s:comment . " ************************************************************************** *\/"

  call append (0, s:start)
  call append (1, s:empty)
  call append (2, s:top42)
  call append (3, s:file)
  call append (4, s:belowFile)
  call append (5, s:author)
  call append (6, s:mid)
  call append (7, s:created)
  call append (8, s:modified)
  call append (9, s:empty)
  call append (10, s:end)

  unlet s:comment
  unlet s:author
  unlet s:file
  unlet s:created
  unlet s:modified

endfunction


" FUNCTION:
" Update the date of last modification.
" Check the line number 6 looking for the pattern.

function s:update ()

  call s:filetype ()

  let s:pattern = s:comment . " MODIFIED: [0-9]"
  let s:line = getline (6)

  if match (s:line, s:pattern) != -1
    let s:modified = s:comment . " MODIFIED: " . strftime ("%Y-%m-%d %H:%M:%S")
    call setline (6, s:modified)
    unlet s:modified
  endif

  unlet s:comment
  unlet s:pattern
  unlet s:line

endfunction


autocmd BufNewFile * call s:insert ()
autocmd BufWritePre * call s:update ()
