set t_Co=256

" Jump to matching XML/HTML tag 
runtime macros/matchit.vim

" Choose colorscheme:
" colorscheme default
" set background=dark

" Default shell
set shell=/bin/bash

" Encoding
set encoding=utf-8

" Config UI:
set laststatus=0
set lazyredraw
set linebreak
set nonumber
set norelativenumber
set showcmd
set showmatch
set wildmenu
set wildmode=longest:list,full
set wrap
set nocursorline
set visualbell

" Config indent:
set autoindent
set expandtab
set softtabstop=2
set shiftwidth=2
set tabstop=2
" let g:html_indent_style1 = "inc"
" let g:html_indent_script1 = "inc"

" Config search:
set ignorecase
set incsearch
set nohlsearch
set smartcase

" Config backup:
" set backupdir=~/.vim/backups
" set undodir=~/.vim/backups
" set directory=~/.vim/backups
" set backup
" set writebackup

" Config netrw:
let g:netrw_banner = 0
let g:netrw_hide = 1
let g:netrw_bufsettings = 'relativenumber number'
let g:netrw_liststyle = 3
let g:netrw_winsize = 25

" Config split
set splitright
set splitbelow

" Enable mouse control:
set mouse=a

" Enable jump to last edited line when re-open file:
if has('autocmd')
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") < line("$") | exec "normal! g'\"" | endif
endif

" Config Gvim:
if has('gui_running')
  " Set colorscheme:
  colorscheme default
  set background=light

  " Hide tool bar:
  set guioptions-=T

  " Default window size:
  set columns=75
  set lines=25

  if has('gui_win32')
    " Set font:
    set guifont=consolas:h10
    set encoding=utf-8

    " Config backup path:
    set backupdir=~/vimfiles/backups
    set undodir=~/vimfiles/backups
    set directory=~/vimfiles/backups
  endif
endif

" Change default leader key (my little finger too short for press backsplash key):
let g:mapleader=","

" Shortcuts for replace Escapse key:
nnoremap <Leader><Leader> <Esc>
inoremap <Leader><Leader> <Esc>
vnoremap <Leader><Leader> <Esc>
tnoremap <Leader><Leader> <C-\><C-n>

nnoremap <Leader>. <Esc>
inoremap <Leader>. <Esc>
vnoremap <Leader>. <Esc>
tnoremap <Leader>. <C-\><C-n>

" Shortcuts for open command mode (prompt):
nnoremap <Leader>ee :
vnoremap <Leader>ee :
inoremap <Leader>ee <ESC>:
nnoremap <Leader>er :r!
inoremap <Leader>er <ESC>:r!
nnoremap <Leader>e1 :!
inoremap <Leader>e1 <ESC>:!
nnoremap <Leader>e5 :%!
inoremap <Leader>e5 <ESC>:%!
nnoremap <Leader>et :tab terminal<CR>
nnoremap <Leader>eT :terminal<CR>
nnoremap <Leader>el 0v$hx:put=strftime('# %s')<CR>o# <C-R>"<ESC>:r!<C-r>"<CR>j
inoremap <Leader>el <ESC>0v$hx:put=strftime('# %s')<CR>o# <C-R>"<ESC>:r!<C-r>"<CR>o
nnoremap <Leader>ei 0v$hx:put=strftime('# %c')<CR>o# <C-R>"<ESC>:r!echo '<C-r>"' \| bash -i<CR>j
inoremap <Leader>ei <ESC>0v$hx:put=strftime('# %s')<CR>o# <C-R>"<ESC>:r!echo '<C-r>"' \| bash -i<CR>o
nnoremap <Leader>edl :s/\(\d\{10\}\)/\=system('date -d @' . submatch(1) . ' +"%Y-%m-%d %H:%M:%S" \| tr -d "\n"')/g<CR>
nnoremap <Leader>edg :%s/\(\d\{10\}\)/\=system('date -d @' . submatch(1) . ' +"%Y-%m-%d %H:%M:%S" \| tr -d "\n"')/g<CR>
nnoremap <Leader>edc :%s/\(\d\{10\}\)/\=system('date -d @' . submatch(1) . ' +"%Y-%m-%d %H:%M:%S" \| tr -d "\n"')/gc<CR>

" Shortcuts for quickly save and exit:
nnoremap <Leader>ww :w<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>wf :w!<CR>
nnoremap <Leader>qq :q<CR>
nnoremap <Leader>qf :q!<CR>
nnoremap <Leader>qa :qa<CR>
nnoremap <Leader>qc :qa!<CR>
inoremap <Leader>ww <ESC>:w<CR>a
inoremap <Leader>wq <ESC>:wq<CR>
inoremap <Leader>wf <ESC>:w!<CR>a
inoremap <Leader>qq <ESC>:q<CR>
inoremap <Leader>qf <ESC>:q!<CR>
inoremap <Leader>qa <ESC>:qa<CR>
inoremap <Leader>qc <ESC>:qa!<CR>

" Shortcuts for working with many files:
nnoremap <Leader>fe :Explore<CR>
nnoremap <Leader>fv :Vexplore<CR>
nnoremap <Leader>fh :Hexplore<CR>
nnoremap <Leader>ft :Texplore<CR>
nnoremap <Leader>fl :Lexplore %:p:h<CR>
nnoremap <Leader>fr :Rexplore<CR>
nnoremap <Leader>ff :find 

" Shortcuts for working with clipboard:
vnoremap <Leader>cy "+y<CR>
vnoremap <Leader>cx "+x<CR>
nnoremap <Leader>cp "+gp<CR>Config
inoremap <Leader>cp <Esc>"+gpa<CR>
vnoremap <Leader>cp "+gp<CR>
nnoremap <Leader>cl 0v$h"+y$
inoremap <Leader>cl <ESC>0v$h"+y$a

" Shortcuts for toggle input Vietnamese with keymap:
nnoremap <Leader>v0 :set keymap=<CR>
nnoremap <Leader>vq :set keymap=vietnamese-viqr_utf-8<CR>
nnoremap <Leader>vt :set keymap=vietnamese-telex_utf-8<CR>
nnoremap <Leader>vv :set keymap=vietnamese-vni_utf-8<CR>
inoremap <Leader>v0 <ESC>:set keymap=<CR>a
inoremap <Leader>vq <ESC>:set keymap=vietnamese-viqr_utf-8<CR>a
inoremap <Leader>vt <ESC>:set keymap=vietnamese-telex_utf-8<CR>a
inoremap <Leader>vv <ESC>:set keymap=vietnamese-vni_utf-8<CR>a

" Shortcut for UI:
nnoremap <Leader>ut :colorscheme 
nnoremap <Leader>ub :exec &background!="dark" ? "set background=dark" : "set background=light"<CR>
nnoremap <Leader>ul0 :set laststatus=0<CR>
nnoremap <Leader>ul2 :set laststatus=2<CR>
nnoremap <Leader>ud :redraw<CR>
nnoremap <Leader>un :set number!<CR>
nnoremap <Leader>ur :set relativenumber!<CR>
nnoremap <Leader>uw :set wrap!<CR>
nnoremap <Leader>uc :set cursorline!<CR>

" Shortcuts for indent:
nnoremap <Leader>ia :set autoindent!<CR>
nnoremap <Leader>ie :set expandtab!<CR>
nnoremap <Leader>ir :retab<CR>
nnoremap <Leader>i= ggvG=<C-o><C-o>

" Shortcuts for search:
nnoremap <Leader>sh :set hlsearch!<CR>
nnoremap <Leader>ss :set smartcase!<CR>

" Shortcuts for toggle mouse controller:
nnoremap <Leader>m :exec &mouse!="" ? "set mouse=" : "set mouse=a"<CR>

" Shortcuts for tabbed:
nnoremap <Leader>tt :tabnew<CR>
nnoremap <Leader>ts :tabs<CR>
nnoremap <Leader>tm :tabm 
nnoremap <Leader>to :tabonly<CR>
nnoremap <Leader>tf :tabfind 
nnoremap <Leader>tc :tabclose<CR>
nnoremap <Leader>tC :tabclose!<CR>
nnoremap <Leader>t1 1gt
nnoremap <Leader>t2 2gt
nnoremap <Leader>t3 3gt
nnoremap <Leader>t4 4gt
nnoremap <Leader>t5 5gt
nnoremap <Leader>t6 6gt
nnoremap <Leader>t7 7gt
nnoremap <Leader>t8 8gt
nnoremap <Leader>t9 9gt
tnoremap <Leader>t1 <C-w>1gt
tnoremap <Leader>t2 <C-w>2gt
tnoremap <Leader>t3 <C-w>3gt
tnoremap <Leader>t4 <C-w>4gt
tnoremap <Leader>t5 <C-w>5gt
tnoremap <Leader>t6 <C-w>6gt
tnoremap <Leader>t7 <C-w>7gt
tnoremap <Leader>t8 <C-w>8gt
tnoremap <Leader>t9 <C-w>9gt

" Set path for quickly find an item in a project:
set path+=**

" Shortcuts for code action in coc.nvim
nmap <silent><leader>a <Plug>(coc-codeaction)
vmap <silent><leader>a <Plug>(coc-codeaction-selected)

" Shortcuts for code action in coc.nvim
nmap <silent><leader>d <Plug>(coc-definition)
nmap <silent><leader>D <Plug>(coc-implementation)
nmap <silent><leader>r <Plug>(coc-references)

" Shortcuts for split
nnoremap <Leader>w <C-w>

" Shortcuts in terminal mode
tnoremap <Leader>tt <C-w>:tabnew<CR>
tnoremap <Leader>et <C-w>:tab terminal<CR>
tnoremap <Leader>eT <C-w>:terminal<CR>
tnoremap <Leader>tm <C-w>:tabmove 
tnoremap <Leader>tf <C-w>:tabfind 
tnoremap <Leader>to <C-w>:tabonly<CR>
tnoremap <Leader>gt <C-w>gt
tnoremap <Leader>gT <C-w>gT
tnoremap <Leader>q <C-w>:q!<CR>
tnoremap <Leader>ft <C-w>:Texplore<CR>
tnoremap <Leader>w <C-w>

" Shortcuts for prettier & linter
nnoremap <Leader>pp :CocCommand prettier.formatFile<CR>
nnoremap <Leader>pd :DartFmt<CR>

" Shortcuts for switch between favorite language syntax
nnoremap <Leader>l0 :set ft=<CR>
nnoremap <Leader>lh :set ft=html<CR>
nnoremap <Leader>lc :set ft=css<CR>
nnoremap <Leader>lj :set ft=javascript<CR>
nnoremap <Leader>lJ :set ft=json<CR>
nnoremap <Leader>ld :set ft=dart<CR>
nnoremap <Leader>ls :set ft=sh<CR>
nnoremap <Leader>lp :set ft=python<CR>
