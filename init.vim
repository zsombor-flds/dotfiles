call plug#begin('~/.local/share/nvim/plugged')

Plug 'davidhalter/jedi-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'phanviet/vim-monokai-pro'
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

" Enable deoplete ( python auto completion)
let g:deoplete#enable_at_startup = 1

" Auto close deoplete completion window
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Enable relative line number
set number relativenumber

" Set enable system wise clipboard
set clipboard=unnamedplus
set mouse=a

"set termguicolors
"colorscheme monokai_pro
syntax enable
colorscheme monokai

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

"Auto open NERDTree in all tab
"autocmd BufWinEnter * NERDTreeMirror


" NERDTree git
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

au VimEnter *  NERDTree


nnoremap <silent> <C-B> :NERDTreeToggle<CR>

function! NERDTreeYankFullPath()
    let n = g:NERDTreeFileNode.GetSelected()
    if n != {}
        call setreg('"', n.path.str())
    endif
    call nerdtree#echo("Node full path yanked!")
endfunction

