" @Author Miguel Blanco
" auto indent by file type
if has("autocmd")
	filetype indent plugin on
endif

" syntax highlight
syntax on

set number

set relativenumber

set noswapfile

" refresh configs for GitGutter
set updatetime=100

set foldtext=gitgutter#fold#foldtext()

" show both status line and line number
set signcolumn=yes

" git gutter status line
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}

" configure gutter color
highlight clear SignColumn
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

