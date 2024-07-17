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
" let g:netrw_winsize = 25

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

" Shortcuts for execute system command
nnoremap <Leader>el 0v$hx:put=strftime('# %s')<CR>o# <C-R>"<ESC>:r!<C-r>"<CR>j
inoremap <Leader>el <ESC>0v$hx:put=strftime('# %s')<CR>o# <C-R>"<ESC>:r!<C-r>"<CR>o
nnoremap <Leader>ei 0v$hx:put=strftime('# %c')<CR>o# <C-R>"<ESC>:r!echo '<C-r>"' \| bash -i<CR>j
inoremap <Leader>ei <ESC>0v$hx:put=strftime('# %s')<CR>o# <C-R>"<ESC>:r!echo '<C-r>"' \| bash -i<CR>o

" Shortcuts for date and timestamp
vnoremap <Leader>ed :s/\(\d\{10\}\)/\=system('date -d @' . submatch(1) . ' +"%Y-%m-%d %H:%M:%S" \| tr -d "\n"')/g<CR>
nnoremap <Leader>edl :s/\(\d\{10\}\)/\=system('date -d @' . submatch(1) . ' +"%Y-%m-%d %H:%M:%S" \| tr -d "\n"')/g<CR>
nnoremap <Leader>edg :%s/\(\d\{10\}\)/\=system('date -d @' . submatch(1) . ' +"%Y-%m-%d %H:%M:%S" \| tr -d "\n"')/g<CR>
nnoremap <Leader>edc :%s/\(\d\{10\}\)/\=system('date -d @' . submatch(1) . ' +"%Y-%m-%d %H:%M:%S" \| tr -d "\n"')/gc<CR>
nnoremap <Leader>edt :put=strftime('%s')<CR>
inoremap <Leader>edt <Esc>:put=strftime('%s')<CR>A
nnoremap <Leader>edT :put=strftime('%Y%m%d%H%M%S')<CR>
inoremap <Leader>edT <Esc>:put=strftime('%Y%m%d%H%M%S')<CR>A

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

" Shortcuts for file path completion
inoremap <Leader>p <C-x><C-f>
inoremap <Leader><C-i> <C-x><C-f> "<Leader + tab

" Shortcuts for encode and decode
nnoremap <Leader>xhe :%!xxd \| awk -F'  ' '{print $1}'<CR>
nnoremap <Leader>xhd :%!xxd -r<CR>
inoremap <Leader>xhe <Esc>:%!xxd \| awk -F'  ' '{print $1}'<CR>i
inoremap <Leader>xhd <Esc>:%!xxd -r<CR>i
vnoremap <Leader>xhe :!xxd \| awk -F'  ' '{print $1}'<CR>
vnoremap <Leader>xhd :!xxd -r<CR>

inoremap <Leader>xr <Esc>:%!tr 'A-Za-z' 'N-ZA-Mn-za-m'<CR>i
nnoremap <Leader>xr :%!tr 'A-Za-z' 'N-ZA-Mn-za-m'<CR>
vnoremap <Leader>xr :!tr 'A-Za-z' 'N-ZA-Mn-za-m'<CR>

inoremap <Leader>xbe <Esc>:%!base64 -w 0<CR>i
inoremap <Leader>xbd <Esc>:%!base64 -d -w 0<CR>i
nnoremap <Leader>xbe :%!base64 -w 0<CR>
nnoremap <Leader>xbd :%!base64 -d -w 0<CR>
vnoremap <Leader>xbe :!base64 -w 0<CR>
vnoremap <Leader>xbd :!base64 -d -w 0<CR>

" Shortcuts for buffers
nnoremap <Leader>bl :buffers<CR>
nnoremap <Leader>bc :close<CR>
nnoremap <Leader>bd :bd 
nnoremap <Leader>bg :buffer 

" Shortcuts for subtitude text to Vietnamese Telex
nnoremap <Leader>n :%!sed 's/yj/ỵ/g; s/yx/ỹ/g; s/yr/ỷ/g; s/ys/ý/g; s/yf/ỳ/g; s/y\\/y/g; s/uwj/ự/g; s/uwx/ữ/g; s/uwr/ử/g; s/uws/ứ/g; s/uwf/ừ/g; s/uw\\/ư/g; s/uw/ư/g; s/uj/ụ/g; s/ux/ũ/g; s/ur/ủ/g; s/us/ú/g; s/uf/ù/g; s/u\\/u/g; s/owj/ợ/g; s/owx/ỡ/g; s/owr/ở/g; s/ows/ớ/g; s/owf/ờ/g; s/ow\\/ơ/g; s/ow/ơ/g; s/ooj/ộ/g; s/oox/ỗ/g; s/oor/ổ/g; s/oos/ố/g; s/oof/ồ/g; s/oo\\/ô/g; s/oo/ô/g; s/oj/ọ/g; s/ox/õ/g; s/or/ỏ/g; s/os/ó/g; s/of/ò/g; s/o\\/o/g; s/ij/ị/g; s/ix/ĩ/g; s/ir/ỉ/g; s/is/í/g; s/if/ì/g; s/i\\/i/g; s/eej/ệ/g; s/eex/ễ/g; s/eer/ể/g; s/ees/ế/g; s/eef/ề/g; s/ee\\/ê/g; s/ee/ê/g; s/ej/ẹ/g; s/ex/ẽ/g; s/er/ẻ/g; s/es/é/g; s/ef/è/g; s/e\\/e/g; s/dd/đ/g; s/d\\/d/g; s/aaj/ậ/g; s/aax/ẫ/g; s/aar/ẩ/g; s/aas/ấ/g; s/aaf/ầ/g; s/aa\\/â/g; s/aa/â/g; s/awj/ặ/g; s/awx/ẵ/g; s/awr/ẳ/g; s/aws/ắ/g; s/awf/ằ/g; s/aw\\/ă/g; s/aw/ă/g; s/aj/ạ/g; s/ax/ã/g; s/ar/ả/g; s/as/á/g; s/af/à/g; s/a\\/a/g; s/YJ/Ỵ/g; s/YX/Ỹ/g; s/YR/Ỷ/g; s/YS/Ý/g; s/YF/Ỳ/g; s/Y\\/Y/g; s/UWJ/Ự/g; s/UWX/Ữ/g; s/UWR/Ử/g; s/UWS/Ứ/g; s/UWF/Ừ/g; s/UW\\/Ư/g; s/UW/Ư/g; s/UJ/Ụ/g; s/UX/Ũ/g; s/UR/Ủ/g; s/US/Ú/g; s/UF/Ù/g; s/U\\/U/g; s/OWJ/Ợ/g; s/OWX/Ỡ/g; s/OWR/Ở/g; s/OWS/Ớ/g; s/OWF/Ờ/g; s/OW\\/Ơ/g; s/OW/Ơ/g; s/OOJ/Ộ/g; s/OOX/Ỗ/g; s/OOR/Ổ/g; s/OOS/Ố/g; s/OOF/Ồ/g; s/OO\\/Ô/g; s/OO/Ô/g; s/OJ/Ọ/g; s/OX/Õ/g; s/OR/Ỏ/g; s/OS/Ó/g; s/OF/Ò/g; s/O\\/O/g; s/IJ/Ị/g; s/IX/Ĩ/g; s/IR/Ỉ/g; s/IS/Í/g; s/IF/Ì/g; s/I\\/I/g; s/EEJ/Ệ/g; s/EEX/Ễ/g; s/EER/Ể/g; s/EES/Ế/g; s/EEF/Ề/g; s/EE\\/Ê/g; s/EE/Ê/g; s/EJ/Ẹ/g; s/EX/Ẽ/g; s/ER/Ẻ/g; s/ES/É/g; s/EF/È/g; s/E\\/E/g; s/E/E/g; s/DD/Đ/g; s/D\\/D/g; s/AAJ/Ậ/g; s/AAX/Ẫ/g; s/AAR/Ẩ/g; s/AAS/Ấ/g; s/AAF/Ầ/g; s/AA\\/Â/g; s/AA/Â/g; s/AWJ/Ặ/g; s/AWX/Ẵ/g; s/AWR/Ẳ/g; s/AWS/Ắ/g; s/AWF/Ằ/g; s/AW\\/Ă/g; s/AW/Ă/g; s/AJ/Ạ/g; s/AX/Ã/g; s/AR/Ả/g; s/AS/Á/g; s/AF/À/g; s/A\\/A/g;'<CR><CR>
vnoremap <Leader>n :!sed 's/yj/ỵ/g; s/yx/ỹ/g; s/yr/ỷ/g; s/ys/ý/g; s/yf/ỳ/g; s/y\\/y/g; s/uwj/ự/g; s/uwx/ữ/g; s/uwr/ử/g; s/uws/ứ/g; s/uwf/ừ/g; s/uw\\/ư/g; s/uw/ư/g; s/uj/ụ/g; s/ux/ũ/g; s/ur/ủ/g; s/us/ú/g; s/uf/ù/g; s/u\\/u/g; s/owj/ợ/g; s/owx/ỡ/g; s/owr/ở/g; s/ows/ớ/g; s/owf/ờ/g; s/ow\\/ơ/g; s/ow/ơ/g; s/ooj/ộ/g; s/oox/ỗ/g; s/oor/ổ/g; s/oos/ố/g; s/oof/ồ/g; s/oo\\/ô/g; s/oo/ô/g; s/oj/ọ/g; s/ox/õ/g; s/or/ỏ/g; s/os/ó/g; s/of/ò/g; s/o\\/o/g; s/ij/ị/g; s/ix/ĩ/g; s/ir/ỉ/g; s/is/í/g; s/if/ì/g; s/i\\/i/g; s/eej/ệ/g; s/eex/ễ/g; s/eer/ể/g; s/ees/ế/g; s/eef/ề/g; s/ee\\/ê/g; s/ee/ê/g; s/ej/ẹ/g; s/ex/ẽ/g; s/er/ẻ/g; s/es/é/g; s/ef/è/g; s/e\\/e/g; s/dd/đ/g; s/d\\/d/g; s/aaj/ậ/g; s/aax/ẫ/g; s/aar/ẩ/g; s/aas/ấ/g; s/aaf/ầ/g; s/aa\\/â/g; s/aa/â/g; s/awj/ặ/g; s/awx/ẵ/g; s/awr/ẳ/g; s/aws/ắ/g; s/awf/ằ/g; s/aw\\/ă/g; s/aw/ă/g; s/aj/ạ/g; s/ax/ã/g; s/ar/ả/g; s/as/á/g; s/af/à/g; s/a\\/a/g; s/YJ/Ỵ/g; s/YX/Ỹ/g; s/YR/Ỷ/g; s/YS/Ý/g; s/YF/Ỳ/g; s/Y\\/Y/g; s/UWJ/Ự/g; s/UWX/Ữ/g; s/UWR/Ử/g; s/UWS/Ứ/g; s/UWF/Ừ/g; s/UW\\/Ư/g; s/UW/Ư/g; s/UJ/Ụ/g; s/UX/Ũ/g; s/UR/Ủ/g; s/US/Ú/g; s/UF/Ù/g; s/U\\/U/g; s/OWJ/Ợ/g; s/OWX/Ỡ/g; s/OWR/Ở/g; s/OWS/Ớ/g; s/OWF/Ờ/g; s/OW\\/Ơ/g; s/OW/Ơ/g; s/OOJ/Ộ/g; s/OOX/Ỗ/g; s/OOR/Ổ/g; s/OOS/Ố/g; s/OOF/Ồ/g; s/OO\\/Ô/g; s/OO/Ô/g; s/OJ/Ọ/g; s/OX/Õ/g; s/OR/Ỏ/g; s/OS/Ó/g; s/OF/Ò/g; s/O\\/O/g; s/IJ/Ị/g; s/IX/Ĩ/g; s/IR/Ỉ/g; s/IS/Í/g; s/IF/Ì/g; s/I\\/I/g; s/EEJ/Ệ/g; s/EEX/Ễ/g; s/EER/Ể/g; s/EES/Ế/g; s/EEF/Ề/g; s/EE\\/Ê/g; s/EE/Ê/g; s/EJ/Ẹ/g; s/EX/Ẽ/g; s/ER/Ẻ/g; s/ES/É/g; s/EF/È/g; s/E\\/E/g; s/E/E/g; s/DD/Đ/g; s/D\\/D/g; s/AAJ/Ậ/g; s/AAX/Ẫ/g; s/AAR/Ẩ/g; s/AAS/Ấ/g; s/AAF/Ầ/g; s/AA\\/Â/g; s/AA/Â/g; s/AWJ/Ặ/g; s/AWX/Ẵ/g; s/AWR/Ẳ/g; s/AWS/Ắ/g; s/AWF/Ằ/g; s/AW\\/Ă/g; s/AW/Ă/g; s/AJ/Ạ/g; s/AX/Ã/g; s/AR/Ả/g; s/AS/Á/g; s/AF/À/g; s/A\\/A/g;'<CR><CR>
inoremap <Leader>n <ESC>V:!sed 's/yj/ỵ/g; s/yx/ỹ/g; s/yr/ỷ/g; s/ys/ý/g; s/yf/ỳ/g; s/y\\/y/g; s/uwj/ự/g; s/uwx/ữ/g; s/uwr/ử/g; s/uws/ứ/g; s/uwf/ừ/g; s/uw\\/ư/g; s/uw/ư/g; s/uj/ụ/g; s/ux/ũ/g; s/ur/ủ/g; s/us/ú/g; s/uf/ù/g; s/u\\/u/g; s/owj/ợ/g; s/owx/ỡ/g; s/owr/ở/g; s/ows/ớ/g; s/owf/ờ/g; s/ow\\/ơ/g; s/ow/ơ/g; s/ooj/ộ/g; s/oox/ỗ/g; s/oor/ổ/g; s/oos/ố/g; s/oof/ồ/g; s/oo\\/ô/g; s/oo/ô/g; s/oj/ọ/g; s/ox/õ/g; s/or/ỏ/g; s/os/ó/g; s/of/ò/g; s/o\\/o/g; s/ij/ị/g; s/ix/ĩ/g; s/ir/ỉ/g; s/is/í/g; s/if/ì/g; s/i\\/i/g; s/eej/ệ/g; s/eex/ễ/g; s/eer/ể/g; s/ees/ế/g; s/eef/ề/g; s/ee\\/ê/g; s/ee/ê/g; s/ej/ẹ/g; s/ex/ẽ/g; s/er/ẻ/g; s/es/é/g; s/ef/è/g; s/e\\/e/g; s/dd/đ/g; s/d\\/d/g; s/aaj/ậ/g; s/aax/ẫ/g; s/aar/ẩ/g; s/aas/ấ/g; s/aaf/ầ/g; s/aa\\/â/g; s/aa/â/g; s/awj/ặ/g; s/awx/ẵ/g; s/awr/ẳ/g; s/aws/ắ/g; s/awf/ằ/g; s/aw\\/ă/g; s/aw/ă/g; s/aj/ạ/g; s/ax/ã/g; s/ar/ả/g; s/as/á/g; s/af/à/g; s/a\\/a/g; s/YJ/Ỵ/g; s/YX/Ỹ/g; s/YR/Ỷ/g; s/YS/Ý/g; s/YF/Ỳ/g; s/Y\\/Y/g; s/UWJ/Ự/g; s/UWX/Ữ/g; s/UWR/Ử/g; s/UWS/Ứ/g; s/UWF/Ừ/g; s/UW\\/Ư/g; s/UW/Ư/g; s/UJ/Ụ/g; s/UX/Ũ/g; s/UR/Ủ/g; s/US/Ú/g; s/UF/Ù/g; s/U\\/U/g; s/OWJ/Ợ/g; s/OWX/Ỡ/g; s/OWR/Ở/g; s/OWS/Ớ/g; s/OWF/Ờ/g; s/OW\\/Ơ/g; s/OW/Ơ/g; s/OOJ/Ộ/g; s/OOX/Ỗ/g; s/OOR/Ổ/g; s/OOS/Ố/g; s/OOF/Ồ/g; s/OO\\/Ô/g; s/OO/Ô/g; s/OJ/Ọ/g; s/OX/Õ/g; s/OR/Ỏ/g; s/OS/Ó/g; s/OF/Ò/g; s/O\\/O/g; s/IJ/Ị/g; s/IX/Ĩ/g; s/IR/Ỉ/g; s/IS/Í/g; s/IF/Ì/g; s/I\\/I/g; s/EEJ/Ệ/g; s/EEX/Ễ/g; s/EER/Ể/g; s/EES/Ế/g; s/EEF/Ề/g; s/EE\\/Ê/g; s/EE/Ê/g; s/EJ/Ẹ/g; s/EX/Ẽ/g; s/ER/Ẻ/g; s/ES/É/g; s/EF/È/g; s/E\\/E/g; s/E/E/g; s/DD/Đ/g; s/D\\/D/g; s/AAJ/Ậ/g; s/AAX/Ẫ/g; s/AAR/Ẩ/g; s/AAS/Ấ/g; s/AAF/Ầ/g; s/AA\\/Â/g; s/AA/Â/g; s/AWJ/Ặ/g; s/AWX/Ẵ/g; s/AWR/Ẳ/g; s/AWS/Ắ/g; s/AWF/Ằ/g; s/AW\\/Ă/g; s/AW/Ă/g; s/AJ/Ạ/g; s/AX/Ã/g; s/AR/Ả/g; s/AS/Á/g; s/AF/À/g; s/A\\/A/g;'<CR><CR>A
