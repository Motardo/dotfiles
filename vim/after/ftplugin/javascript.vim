function! NextMethod()
  let search = @/
  :execute "normal! +/function\<cr>^" | :nohlsearch
  let @/ = search
endfunction

function! PrevMethod()
  let search = @/
  :execute "normal! -?function\<cr>^" | :nohlsearch
  let @/ = search
endfunction

nnoremap ]m :call NextMethod()<cr>
nnoremap [m :call PrevMethod()<cr>

let &makeprg = 'checkAllJs'
let &errorformat =
        \ '%E%f: line %l\, col %c\, Error - %m,' .
        \ '%W%f: line %l\, col %c\, Warning - %m,' .
        \ '%-G%.%#'

