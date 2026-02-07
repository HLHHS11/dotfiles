" backspace setting for mac
set backspace=indent,eol,start

set clipboard=unnamedplus

"" plugin
call plug#begin()

" ステータスラインを表示する
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" ファイルツリーを表示する
Plug 'lambdalisue/fern.vim'

" ファイルツリーにgitの差分を表示する
Plug 'lambdalisue/fern-git-status.vim'

" 編集画面でgitの差分を表示する
Plug 'airblade/vim-gitgutter'

" vim-easymotion
Plug 'easymotion/vim-easymotion'

" surround.vim
Plug 'tpope/vim-surround'

call plug#end()

"" vim-airline
" タブラインを表示する
let g:airline#extensions#tabline#enabled = 1

" Ctrl+nでファイルツリーを表示/非表示する
nnoremap <C-n> :Fern . -reveal=% -drawer -toggle -width=20<CR>

