"        _                    
" __   _(_)_ __ ___  _ __ ___ 
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__ 
" (_)_/ |_|_| |_| |_|_|  \___|
"                            


" color
set t_Co=256
syntax on
colorscheme default
set background=dark

" ui
set laststatus=0
set wildmenu

" search
set incsearch

" default shell for terminal mode
set shell=/bin/bash

" encoding
set encoding=utf-8

" Set path for quickly find an item in cwd:
set path+=**

" indentation
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4

" netrw
let g:netrw_banner = 0
let g:netrw_hide = 1
let g:netrw_bufsettings = 'relativenumber number'
let g:netrw_liststyle = 3

" enable mouse
set mouse=a

" jump to last edited line when re-open file:
if has('autocmd')
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") < line("$") | exec "normal! g'\"" | endif
endif

" leader
let g:mapleader=","

" map escape
nnoremap <Leader>. <Esc>
vnoremap <Leader>. <Esc>
inoremap <Leader>. <Esc>
tnoremap <Leader>. <C-\><C-n>

" map open, save, quit
nnoremap <Leader>ww :w<CR>
nnoremap <Leader>wf :w!<CR>
nnoremap <Leader>wq :wq<CR>
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

" map execute
nnoremap <Leader>er :r!
nnoremap <Leader>e1 :!
nnoremap <Leader>e5 :%!
vnoremap <Leader>er :!
inoremap <Leader>ee <ESC>:
inoremap <Leader>er <ESC>:r!
inoremap <Leader>e1 <ESC>:!
inoremap <Leader>e5 <ESC>:%!

" map execute shell command for current line
nnoremap <Leader>el 0v$hx:put=strftime('# %s')<CR>o<C-R>"<CR><ESC>:r!<C-r>"<CR>o<CR><ESC>
inoremap <Leader>el <ESC>0v$hx:put=strftime('# %s')<CR>o<C-R>"<CR><ESC>:r!<C-r>"<CR>o<CR>

" map execute shell command for current line in interactive mode
nnoremap <Leader>ei 0v$hx:put=strftime('# %s')<CR>o<C-R>"<CR><ESC>:r!echo '<C-r>"' \| bash -i<CR>o<CR><ESC>
inoremap <Leader>ei <ESC>0v$hx:put=strftime('# %s')<CR>o<C-R>"<CR><ESC>:r!echo '<C-r>"' \| bash -i<CR>o<CR>

" map datetime
vnoremap <Leader>edt :s/\(\d\{10\}\)/\=system('date -d @' . submatch(1) . ' +"%Y-%m-%d %H:%M:%S" \| tr -d "\n"')/g<CR>
vnoremap <Leader>edT :s/\(\d\{4\}\)\(\d\{2\}\)\(\d\{2\}\)\(\d\{2\}\)\(\d\{2\}\)\(\d\{2\}\)/\1-\2\-\3 \4:\5:\6/g<CR>

nnoremap <Leader>edt :put=strftime('%s')<CR>
inoremap <Leader>edt <Esc>:put=strftime('%s')<CR>A
nnoremap <Leader>edT :put=strftime('%Y%m%d%H%M%S')<CR>
inoremap <Leader>edT <Esc>:put=strftime('%Y%m%d%H%M%S')<CR>A

" map file explorer
nnoremap <Leader>fe :Explore<CR>
nnoremap <Leader>fv :Vexplore<CR>
nnoremap <Leader>fh :Hexplore<CR>
nnoremap <Leader>ft :Texplore<CR>
nnoremap <Leader>fl :Lexplore %:p:h<CR>
nnoremap <Leader>fr :Rexplore<CR>
nnoremap <Leader>ff :find 

" map clipboard
nnoremap <Leader>cp "+gp<CR>Config
nnoremap <Leader>cl 0v$h"+y$
vnoremap <Leader>cy "+y<CR>
vnoremap <Leader>cx "+x<CR>
vnoremap <Leader>cp "+gp<CR>
inoremap <Leader>cp <Esc>"+gpa<CR>
inoremap <Leader>cl <ESC>0v$h"+y$a

" map vietnamese keymap
nnoremap <Leader>v0 :set keymap=<CR>
nnoremap <Leader>vq :set keymap=vietnamese-viqr_utf-8<CR>
nnoremap <Leader>vt :set keymap=vietnamese-telex_utf-8<CR>
nnoremap <Leader>vv :set keymap=vietnamese-vni_utf-8<CR>
inoremap <Leader>v0 <ESC>:set keymap=<CR>a
inoremap <Leader>vq <ESC>:set keymap=vietnamese-viqr_utf-8<CR>a
inoremap <Leader>vt <ESC>:set keymap=vietnamese-telex_utf-8<CR>a
inoremap <Leader>vv <ESC>:set keymap=vietnamese-vni_utf-8<CR>a

" macos vim doesn't support keymap
nnoremap <Leader>v :call Telex()<CR>
vnoremap <Leader>v :<C-u>call VTelex()<CR>
vnoremap <Leader>V :<C-u>call UnTelex()<CR>
inoremap <Leader>v <ESC>V:call VTelex()<CR>A

" map ui
nnoremap <Leader>ut :colorscheme 
nnoremap <Leader>ub :exec &background!="dark" ? "set background=dark" : "set background=light"<CR>
nnoremap <Leader>ul0 :set laststatus=0<CR>
nnoremap <Leader>ul1 :set laststatus=1<CR>
nnoremap <Leader>ul2 :set laststatus=2<CR>
nnoremap <Leader>urd :redraw<CR>
nnoremap <Leader>un :set number!<CR>
nnoremap <Leader>urn :set relativenumber!<CR>
nnoremap <Leader>uw :set wrap!<CR>
nnoremap <Leader>ucl :set cursorline!<CR>
nnoremap <Leader>use :syntax on<CR>
nnoremap <Leader>usd :syntax off<CR>
nnoremap <Leader>ucc0 :set cc=<CR>
nnoremap <Leader>ucc8 :set cc=80<CR>
nnoremap <Leader>ucc :set cc=
nnoremap <Leader>ul :set list!<CR>

" map indent
nnoremap <Leader>ia :set autoindent!<CR>
nnoremap <Leader>ie :set expandtab!<CR>
nnoremap <Leader>ir :%retab<CR>
nnoremap <Leader>i= ggvG=<C-o><C-o>
nnoremap <Leader>i2 :set tabstop=2 \| set softtabstop=2 \| set shiftwidth=2<CR>
nnoremap <Leader>i4 :set tabstop=4 \| set softtabstop=4 \| set shiftwidth=4<CR>
nnoremap <Leader>i8 :set tabstop=8 \| set softtabstop=8 \| set shiftwidth=8<CR>
nnoremap <Leader>il :exec &list!="nolist" ? "set nolist" : "set list \| set listchars=tab:░▒"<CR>

" map search
nnoremap <Leader>sh :set hlsearch!<CR>
nnoremap <Leader>ss :set smartcase!<CR>
nnoremap <Leader>sc :set ignorecase!<CR>
nnoremap <Leader>si :set incsearch!<CR>

" map mouse
nnoremap <Leader>m :exec &mouse!="" ? "set mouse=" : "set mouse=a"<CR>

" map tab
nnoremap <Leader>tt :tabnew<CR>
nnoremap <Leader>ts :tabs<CR>
nnoremap <Leader>to :tabonly<CR>
nnoremap <Leader>tf :tabfind 
nnoremap <Leader>tc :tabclose<CR>
nnoremap <Leader>tq :tabclose!<CR>
nnoremap <Leader>t1 1gt
nnoremap <Leader>t2 2gt
nnoremap <Leader>t3 3gt
nnoremap <Leader>t4 4gt
nnoremap <Leader>t5 5gt
nnoremap <Leader>t6 6gt
nnoremap <Leader>t7 7gt
nnoremap <Leader>t8 8gt
nnoremap <Leader>t9 9gt
nnoremap <Leader>tm :tabmove 
nnoremap <Leader>tm0 :tabm 0<CR> 
nnoremap <Leader>tm1 :tabm 1<CR> 
nnoremap <Leader>tm2 :tabm 2<CR> 
nnoremap <Leader>tm3 :tabm 3<CR> 
nnoremap <Leader>tm4 :tabm 4<CR> 
nnoremap <Leader>tm5 :tabm 5<CR> 
nnoremap <Leader>tm6 :tabm 6<CR> 
nnoremap <Leader>tm7 :tabm 7<CR> 
nnoremap <Leader>tm8 :tabm 8<CR> 
nnoremap <Leader>tm9 :tabm 9<CR> 
nnoremap <Leader>tm-1 :tabm -1<CR> 
nnoremap <Leader>tm-2 :tabm -2<CR> 
nnoremap <Leader>tm-3 :tabm -3<CR> 
nnoremap <Leader>tm-4 :tabm -4<CR> 
nnoremap <Leader>tm-5 :tabm -5<CR> 
nnoremap <Leader>tm-6 :tabm -6<CR> 
nnoremap <Leader>tm-7 :tabm -7<CR> 
nnoremap <Leader>tm-8 :tabm -8<CR> 
nnoremap <Leader>tm-9 :tabm -9<CR> 
nnoremap <Leader>tm+1 :tabm +1<CR> 
nnoremap <Leader>tm+2 :tabm +2<CR> 
nnoremap <Leader>tm+3 :tabm +3<CR> 
nnoremap <Leader>tm+4 :tabm +4<CR> 
nnoremap <Leader>tm+5 :tabm +5<CR> 
nnoremap <Leader>tm+6 :tabm +6<CR> 
nnoremap <Leader>tm+7 :tabm +7<CR> 
nnoremap <Leader>tm+8 :tabm +8<CR> 
nnoremap <Leader>tm+9 :tabm +9<CR> 

tnoremap <Leader>gt <C-w>gt
tnoremap <Leader>gT <C-w>gT
tnoremap <Leader>tt <C-w>:tabnew<CR>
tnoremap <Leader>to <C-w>:tabonly<CR>
tnoremap <Leader>t1 <C-w>1gt
tnoremap <Leader>t2 <C-w>2gt
tnoremap <Leader>t3 <C-w>3gt
tnoremap <Leader>t4 <C-w>4gt
tnoremap <Leader>t5 <C-w>5gt
tnoremap <Leader>t6 <C-w>6gt
tnoremap <Leader>t7 <C-w>7gt
tnoremap <Leader>t8 <C-w>8gt
tnoremap <Leader>t9 <C-w>9gt
tnoremap <Leader>tm <C-w>:tabmove 
tnoremap <Leader>tm0 <C-w>:tabm 0<CR> 
tnoremap <Leader>tm1 <C-w>:tabm 1<CR> 
tnoremap <Leader>tm2 <C-w>:tabm 2<CR> 
tnoremap <Leader>tm3 <C-w>:tabm 3<CR> 
tnoremap <Leader>tm4 <C-w>:tabm 4<CR> 
tnoremap <Leader>tm5 <C-w>:tabm 5<CR> 
tnoremap <Leader>tm6 <C-w>:tabm 6<CR> 
tnoremap <Leader>tm7 <C-w>:tabm 7<CR> 
tnoremap <Leader>tm8 <C-w>:tabm 8<CR> 
tnoremap <Leader>tm9 <C-w>:tabm 9<CR> 
tnoremap <Leader>tm-1 <C-w>:tabm -1<CR> 
tnoremap <Leader>tm-2 <C-w>:tabm -2<CR> 
tnoremap <Leader>tm-3 <C-w>:tabm -3<CR> 
tnoremap <Leader>tm-4 <C-w>:tabm -4<CR> 
tnoremap <Leader>tm-5 <C-w>:tabm -5<CR> 
tnoremap <Leader>tm-6 <C-w>:tabm -6<CR> 
tnoremap <Leader>tm-7 <C-w>:tabm -7<CR> 
tnoremap <Leader>tm-8 <C-w>:tabm -8<CR> 
tnoremap <Leader>tm-9 <C-w>:tabm -9<CR> 
tnoremap <Leader>tm+1 <C-w>:tabm +1<CR> 
tnoremap <Leader>tm+2 <C-w>:tabm +2<CR> 
tnoremap <Leader>tm+3 <C-w>:tabm +3<CR> 
tnoremap <Leader>tm+4 <C-w>:tabm +4<CR> 
tnoremap <Leader>tm+5 <C-w>:tabm +5<CR> 
tnoremap <Leader>tm+6 <C-w>:tabm +6<CR> 
tnoremap <Leader>tm+7 <C-w>:tabm +7<CR> 
tnoremap <Leader>tm+8 <C-w>:tabm +8<CR> 
tnoremap <Leader>tm+9 <C-w>:tabm +9<CR> 

" map split
nnoremap <Leader>w <C-w>
nnoremap <Leader>n <C-w>H :vertical resize 40<CR>zz

" map terminal
nnoremap <Leader>et <C-w>:tab terminal<CR>
nnoremap <Leader>eT <C-w>:terminal<CR>
tnoremap <Leader>et <C-w>:tab terminal<CR>
tnoremap <Leader>eT <C-w>:terminal<CR>
tnoremap <Leader>tf <C-w>:tabfind 
tnoremap <Leader>q <C-w>:q!<CR>
tnoremap <Leader>c <C-w>:close<CR>
tnoremap <Leader>ft <C-w>:Texplore<CR>
tnoremap <Leader>w <C-w>

" map filetype
nnoremap <Leader>l0 :set ft=<CR>
nnoremap <Leader>lh :set ft=html<CR>
nnoremap <Leader>lc :set ft=css<CR>
nnoremap <Leader>lj :set ft=javascript<CR>
nnoremap <Leader>lJ :set ft=json<CR>
nnoremap <Leader>ld :set ft=dart<CR>
nnoremap <Leader>ls :set ft=sh<CR>
nnoremap <Leader>lp :set ft=python<CR>
nnoremap <Leader>ly :set ft=yaml<CR>

" map file path completion
inoremap <Leader>p <C-x><C-f>
inoremap <Leader><C-i> <C-x><C-f>

" map buffer
nnoremap <Leader>bl :buffers<CR>
nnoremap <Leader>bg :buffer 
nnoremap <Leader>bc :close<CR>
nnoremap <Leader>bd :bd 
nnoremap <Leader>bD :%bd\|e#<CR>

" map encode
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

" Define the MultiSubstitute function
function! Telex()
	silent! %s/yj/ỵ/g
	silent! %s/yx/ỹ/g
	silent! %s/yr/ỷ/g
	silent! %s/ys/ý/g
	silent! %s/yf/ỳ/g
	silent! %s/y\\/y/g

	silent! %s/uwj/ự/g
	silent! %s/uwx/ữ/g
	silent! %s/uwr/ử/g
	silent! %s/uws/ứ/g
	silent! %s/uwf/ừ/g
	silent! %s/uw\\/ư/g
	silent! %s/uw/ư/g

	silent! %s/uj/ụ/g
	silent! %s/ux/ũ/g
	silent! %s/ur/ủ/g
	silent! %s/us/ú/g
	silent! %s/uf/ù/g
	silent! %s/u\\/u/g

	silent! %s/owj/ợ/g
	silent! %s/owx/ỡ/g
	silent! %s/owr/ở/g
	silent! %s/ows/ớ/g
	silent! %s/owf/ờ/g
	silent! %s/ow\\/ơ/g
	silent! %s/ow/ơ/g

	silent! %s/ooj/ộ/g
	silent! %s/oox/ỗ/g
	silent! %s/oor/ổ/g
	silent! %s/oos/ố/g
	silent! %s/oof/ồ/g
	silent! %s/oo\\/ô/g
	silent! %s/oo/ô/g

	silent! %s/oj/ọ/g
	silent! %s/ox/õ/g
	silent! %s/or/ỏ/g
	silent! %s/os/ó/g
	silent! %s/of/ò/g
	silent! %s/o\\/o/g

	silent! %s/ij/ị/g
	silent! %s/ix/ĩ/g
	silent! %s/ir/ỉ/g
	silent! %s/is/í/g
	silent! %s/if/ì/g
	silent! %s/i\\/i/g

	silent! %s/eej/ệ/g
	silent! %s/eex/ễ/g
	silent! %s/eer/ể/g
	silent! %s/ees/ế/g
	silent! %s/eef/ề/g
	silent! %s/ee\\/ê/g
	silent! %s/ee/ê/g

	silent! %s/ej/ẹ/g
	silent! %s/ex/ẽ/g
	silent! %s/er/ẻ/g
	silent! %s/es/é/g
	silent! %s/ef/è/g
	silent! %s/e\\/e/g

	silent! %s/dd/đ/g
	silent! %s/d\\/d/g

	silent! %s/aaj/ậ/g
	silent! %s/aax/ẫ/g
	silent! %s/aar/ẩ/g
	silent! %s/aas/ấ/g
	silent! %s/aaf/ầ/g
	silent! %s/aa\\/â/g
	silent! %s/aa/â/g

	silent! %s/awj/ặ/g
	silent! %s/awx/ẵ/g
	silent! %s/awr/ẳ/g
	silent! %s/aws/ắ/g
	silent! %s/awf/ằ/g
	silent! %s/aw\\/ă/g
	silent! %s/aw/ă/g

	silent! %s/aj/ạ/g
	silent! %s/ax/ã/g
	silent! %s/ar/ả/g
	silent! %s/as/á/g
	silent! %s/af/à/g
	silent! %s/a\\/a/g

	silent! %s/YJ/Ỵ/g
	silent! %s/YX/Ỹ/g
	silent! %s/YR/Ỷ/g
	silent! %s/YS/Ý/g
	silent! %s/YF/Ỳ/g
	silent! %s/Y\\/Y/g

	silent! %s/UWJ/Ự/g
	silent! %s/UWX/Ữ/g
	silent! %s/UWR/Ử/g
	silent! %s/UWS/Ứ/g
	silent! %s/UWF/Ừ/g
	silent! %s/UW\\/Ư/g
	silent! %s/UW/Ư/g

	silent! %s/UJ/Ụ/g
	silent! %s/UX/Ũ/g
	silent! %s/UR/Ủ/g
	silent! %s/US/Ú/g
	silent! %s/UF/Ù/g
	silent! %s/U\\/U/g

	silent! %s/OWJ/Ợ/g
	silent! %s/OWX/Ỡ/g
	silent! %s/OWR/Ở/g
	silent! %s/OWS/Ớ/g
	silent! %s/OWF/Ờ/g
	silent! %s/OW\\/Ơ/g
	silent! %s/OW/Ơ/g

	silent! %s/OOJ/Ộ/g
	silent! %s/OOX/Ỗ/g
	silent! %s/OOR/Ổ/g
	silent! %s/OOS/Ố/g
	silent! %s/OOF/Ồ/g
	silent! %s/OO\\/Ô/g
	silent! %s/OO/Ô/g

	silent! %s/OJ/Ọ/g
	silent! %s/OX/Õ/g
	silent! %s/OR/Ỏ/g
	silent! %s/OS/Ó/g
	silent! %s/OF/Ò/g
	silent! %s/O\\/O/g

	silent! %s/IJ/Ị/g
	silent! %s/IX/Ĩ/g
	silent! %s/IR/Ỉ/g
	silent! %s/IS/Í/g
	silent! %s/IF/Ì/g
	silent! %s/I\\/I/g

	silent! %s/EEJ/Ệ/g
	silent! %s/EEX/Ễ/g
	silent! %s/EER/Ể/g
	silent! %s/EES/Ế/g
	silent! %s/EEF/Ề/g
	silent! %s/EE\\/Ê/g
	silent! %s/EE/Ê/g

	silent! %s/EJ/Ẹ/g
	silent! %s/EX/Ẽ/g
	silent! %s/ER/Ẻ/g
	silent! %s/ES/É/g
	silent! %s/EF/È/g
	silent! %s/E\\/E/g
	silent! %s/E/E/g

	silent! %s/DD/Đ/g
	silent! %s/D\\/D/g

	silent! %s/AAJ/Ậ/g
	silent! %s/AAX/Ẫ/g
	silent! %s/AAR/Ẩ/g
	silent! %s/AAS/Ấ/g
	silent! %s/AAF/Ầ/g
	silent! %s/AA\\/Â/g
	silent! %s/AA/Â/g

	silent! %s/AWJ/Ặ/g
	silent! %s/AWX/Ẵ/g
	silent! %s/AWR/Ẳ/g
	silent! %s/AWS/Ắ/g
	silent! %s/AWF/Ằ/g
	silent! %s/AW\\/Ă/g
	silent! %s/AW/Ă/g

	silent! %s/AJ/Ạ/g
	silent! %s/AX/Ã/g
	silent! %s/AR/Ả/g
	silent! %s/AS/Á/g
	silent! %s/AF/À/g
	silent! %s/A\\/A/g
endfunction

function! VTelex()
	silent! '<,'>s/yj/ỵ/g
	silent! '<,'>s/yx/ỹ/g
	silent! '<,'>s/yr/ỷ/g
	silent! '<,'>s/ys/ý/g
	silent! '<,'>s/yf/ỳ/g
	silent! '<,'>s/y\\/y/g

	silent! '<,'>s/uwj/ự/g
	silent! '<,'>s/uwx/ữ/g
	silent! '<,'>s/uwr/ử/g
	silent! '<,'>s/uws/ứ/g
	silent! '<,'>s/uwf/ừ/g
	silent! '<,'>s/uw\\/ư/g
	silent! '<,'>s/uw/ư/g

	silent! '<,'>s/uj/ụ/g
	silent! '<,'>s/ux/ũ/g
	silent! '<,'>s/ur/ủ/g
	silent! '<,'>s/us/ú/g
	silent! '<,'>s/uf/ù/g
	silent! '<,'>s/u\\/u/g

	silent! '<,'>s/owj/ợ/g
	silent! '<,'>s/owx/ỡ/g
	silent! '<,'>s/owr/ở/g
	silent! '<,'>s/ows/ớ/g
	silent! '<,'>s/owf/ờ/g
	silent! '<,'>s/ow\\/ơ/g
	silent! '<,'>s/ow/ơ/g

	silent! '<,'>s/ooj/ộ/g
	silent! '<,'>s/oox/ỗ/g
	silent! '<,'>s/oor/ổ/g
	silent! '<,'>s/oos/ố/g
	silent! '<,'>s/oof/ồ/g
	silent! '<,'>s/oo\\/ô/g
	silent! '<,'>s/oo/ô/g

	silent! '<,'>s/oj/ọ/g
	silent! '<,'>s/ox/õ/g
	silent! '<,'>s/or/ỏ/g
	silent! '<,'>s/os/ó/g
	silent! '<,'>s/of/ò/g
	silent! '<,'>s/o\\/o/g

	silent! '<,'>s/ij/ị/g
	silent! '<,'>s/ix/ĩ/g
	silent! '<,'>s/ir/ỉ/g
	silent! '<,'>s/is/í/g
	silent! '<,'>s/if/ì/g
	silent! '<,'>s/i\\/i/g

	silent! '<,'>s/eej/ệ/g
	silent! '<,'>s/eex/ễ/g
	silent! '<,'>s/eer/ể/g
	silent! '<,'>s/ees/ế/g
	silent! '<,'>s/eef/ề/g
	silent! '<,'>s/ee\\/ê/g
	silent! '<,'>s/ee/ê/g

	silent! '<,'>s/ej/ẹ/g
	silent! '<,'>s/ex/ẽ/g
	silent! '<,'>s/er/ẻ/g
	silent! '<,'>s/es/é/g
	silent! '<,'>s/ef/è/g
	silent! '<,'>s/e\\/e/g

	silent! '<,'>s/dd/đ/g
	silent! '<,'>s/d\\/d/g

	silent! '<,'>s/aaj/ậ/g
	silent! '<,'>s/aax/ẫ/g
	silent! '<,'>s/aar/ẩ/g
	silent! '<,'>s/aas/ấ/g
	silent! '<,'>s/aaf/ầ/g
	silent! '<,'>s/aa\\/â/g
	silent! '<,'>s/aa/â/g

	silent! '<,'>s/awj/ặ/g
	silent! '<,'>s/awx/ẵ/g
	silent! '<,'>s/awr/ẳ/g
	silent! '<,'>s/aws/ắ/g
	silent! '<,'>s/awf/ằ/g
	silent! '<,'>s/aw\\/ă/g
	silent! '<,'>s/aw/ă/g

	silent! '<,'>s/aj/ạ/g
	silent! '<,'>s/ax/ã/g
	silent! '<,'>s/ar/ả/g
	silent! '<,'>s/as/á/g
	silent! '<,'>s/af/à/g
	silent! '<,'>s/a\\/a/g

	silent! '<,'>s/YJ/Ỵ/g
	silent! '<,'>s/YX/Ỹ/g
	silent! '<,'>s/YR/Ỷ/g
	silent! '<,'>s/YS/Ý/g
	silent! '<,'>s/YF/Ỳ/g
	silent! '<,'>s/Y\\/Y/g

	silent! '<,'>s/UWJ/Ự/g
	silent! '<,'>s/UWX/Ữ/g
	silent! '<,'>s/UWR/Ử/g
	silent! '<,'>s/UWS/Ứ/g
	silent! '<,'>s/UWF/Ừ/g
	silent! '<,'>s/UW\\/Ư/g
	silent! '<,'>s/UW/Ư/g

	silent! '<,'>s/UJ/Ụ/g
	silent! '<,'>s/UX/Ũ/g
	silent! '<,'>s/UR/Ủ/g
	silent! '<,'>s/US/Ú/g
	silent! '<,'>s/UF/Ù/g
	silent! '<,'>s/U\\/U/g

	silent! '<,'>s/OWJ/Ợ/g
	silent! '<,'>s/OWX/Ỡ/g
	silent! '<,'>s/OWR/Ở/g
	silent! '<,'>s/OWS/Ớ/g
	silent! '<,'>s/OWF/Ờ/g
	silent! '<,'>s/OW\\/Ơ/g
	silent! '<,'>s/OW/Ơ/g

	silent! '<,'>s/OOJ/Ộ/g
	silent! '<,'>s/OOX/Ỗ/g
	silent! '<,'>s/OOR/Ổ/g
	silent! '<,'>s/OOS/Ố/g
	silent! '<,'>s/OOF/Ồ/g
	silent! '<,'>s/OO\\/Ô/g
	silent! '<,'>s/OO/Ô/g

	silent! '<,'>s/OJ/Ọ/g
	silent! '<,'>s/OX/Õ/g
	silent! '<,'>s/OR/Ỏ/g
	silent! '<,'>s/OS/Ó/g
	silent! '<,'>s/OF/Ò/g
	silent! '<,'>s/O\\/O/g

	silent! '<,'>s/IJ/Ị/g
	silent! '<,'>s/IX/Ĩ/g
	silent! '<,'>s/IR/Ỉ/g
	silent! '<,'>s/IS/Í/g
	silent! '<,'>s/IF/Ì/g
	silent! '<,'>s/I\\/I/g

	silent! '<,'>s/EEJ/Ệ/g
	silent! '<,'>s/EEX/Ễ/g
	silent! '<,'>s/EER/Ể/g
	silent! '<,'>s/EES/Ế/g
	silent! '<,'>s/EEF/Ề/g
	silent! '<,'>s/EE\\/Ê/g
	silent! '<,'>s/EE/Ê/g

	silent! '<,'>s/EJ/Ẹ/g
	silent! '<,'>s/EX/Ẽ/g
	silent! '<,'>s/ER/Ẻ/g
	silent! '<,'>s/ES/É/g
	silent! '<,'>s/EF/È/g
	silent! '<,'>s/E\\/E/g
	silent! '<,'>s/E/E/g

	silent! '<,'>s/DD/Đ/g
	silent! '<,'>s/D\\/D/g

	silent! '<,'>s/AAJ/Ậ/g
	silent! '<,'>s/AAX/Ẫ/g
	silent! '<,'>s/AAR/Ẩ/g
	silent! '<,'>s/AAS/Ấ/g
	silent! '<,'>s/AAF/Ầ/g
	silent! '<,'>s/AA\\/Â/g
	silent! '<,'>s/AA/Â/g

	silent! '<,'>s/AWJ/Ặ/g
	silent! '<,'>s/AWX/Ẵ/g
	silent! '<,'>s/AWR/Ẳ/g
	silent! '<,'>s/AWS/Ắ/g
	silent! '<,'>s/AWF/Ằ/g
	silent! '<,'>s/AW\\/Ă/g
	silent! '<,'>s/AW/Ă/g

	silent! '<,'>s/AJ/Ạ/g
	silent! '<,'>s/AX/Ã/g
	silent! '<,'>s/AR/Ả/g
	silent! '<,'>s/AS/Á/g
	silent! '<,'>s/AF/À/g
	silent! '<,'>s/A\\/A/g
endfunction

function! UnTelex()
	silent! '<,'>s/À/AF/g
	silent! '<,'>s/Á/AS/g
	silent! '<,'>s/Ả/AR/g
	silent! '<,'>s/Ã/AX/g
	silent! '<,'>s/Ạ/AJ/g

	silent! '<,'>s/Ă/AW/g
	silent! '<,'>s/Ă/AW\\/g
	silent! '<,'>s/Ằ/AWF/g
	silent! '<,'>s/Ắ/AWS/g
	silent! '<,'>s/Ẳ/AWR/g
	silent! '<,'>s/Ẵ/AWX/g
	silent! '<,'>s/Ặ/AWJ/g

	silent! '<,'>s/Â/AA/g
	silent! '<,'>s/Â/AA\\/g
	silent! '<,'>s/Ầ/AAF/g
	silent! '<,'>s/Ấ/AAS/g
	silent! '<,'>s/Ẩ/AAR/g
	silent! '<,'>s/Ẫ/AAX/g
	silent! '<,'>s/Ậ/AAJ/g

	silent! '<,'>s/Đ/DD/g

	silent! '<,'>s/E/E\\/g
	silent! '<,'>s/È/EF/g
	silent! '<,'>s/É/ES/g
	silent! '<,'>s/Ẻ/ER/g
	silent! '<,'>s/Ẽ/EX/g
	silent! '<,'>s/Ẹ/EJ/g

	silent! '<,'>s/Ê/EE/g
	silent! '<,'>s/Ê/EE\\/g
	silent! '<,'>s/Ề/EEF/g
	silent! '<,'>s/Ế/EES/g
	silent! '<,'>s/Ể/EER/g
	silent! '<,'>s/Ễ/EEX/g
	silent! '<,'>s/Ệ/EEJ/g

	silent! '<,'>s/Ì/IF/g
	silent! '<,'>s/Í/IS/g
	silent! '<,'>s/Ỉ/IR/g
	silent! '<,'>s/Ĩ/IX/g
	silent! '<,'>s/Ị/IJ/g

	silent! '<,'>s/Ò/OF/g
	silent! '<,'>s/Ó/OS/g
	silent! '<,'>s/Ỏ/OR/g
	silent! '<,'>s/Õ/OX/g
	silent! '<,'>s/Ọ/OJ/g

	silent! '<,'>s/Ô/OO/g
	silent! '<,'>s/Ô/OO\\/g
	silent! '<,'>s/Ồ/OOF/g
	silent! '<,'>s/Ố/OOS/g
	silent! '<,'>s/Ổ/OOR/g
	silent! '<,'>s/Ỗ/OOX/g
	silent! '<,'>s/Ộ/OOJ/g

	silent! '<,'>s/Ơ/OW/g
	silent! '<,'>s/Ơ/OW\\/g
	silent! '<,'>s/Ờ/OWF/g
	silent! '<,'>s/Ớ/OWS/g
	silent! '<,'>s/Ở/OWR/g
	silent! '<,'>s/Ỡ/OWX/g
	silent! '<,'>s/Ợ/OWJ/g

	silent! '<,'>s/Ù/UF/g
	silent! '<,'>s/Ú/US/g
	silent! '<,'>s/Ủ/UR/g
	silent! '<,'>s/Ũ/UX/g
	silent! '<,'>s/Ụ/UJ/g

	silent! '<,'>s/Ư/UW/g
	silent! '<,'>s/Ư/UW\\/g
	silent! '<,'>s/Ừ/UWF/g
	silent! '<,'>s/Ứ/UWS/g
	silent! '<,'>s/Ử/UWR/g
	silent! '<,'>s/Ữ/UWX/g
	silent! '<,'>s/Ự/UWJ/g

	silent! '<,'>s/Ỳ/YF/g
	silent! '<,'>s/Ý/YS/g
	silent! '<,'>s/Ỷ/YR/g
	silent! '<,'>s/Ỹ/YX/g
	silent! '<,'>s/Ỵ/YJ/g

	silent! '<,'>s/à/af/g
	silent! '<,'>s/á/as/g
	silent! '<,'>s/ả/ar/g
	silent! '<,'>s/ã/ax/g
	silent! '<,'>s/ạ/aj/g

	silent! '<,'>s/ă/aw/g
	silent! '<,'>s/ă/aw\\/g
	silent! '<,'>s/ằ/awf/g
	silent! '<,'>s/ắ/aws/g
	silent! '<,'>s/ẳ/awr/g
	silent! '<,'>s/ẵ/awx/g
	silent! '<,'>s/ặ/awj/g

	silent! '<,'>s/â/aa/g
	silent! '<,'>s/â/aa\\/g
	silent! '<,'>s/ầ/aaf/g
	silent! '<,'>s/ấ/aas/g
	silent! '<,'>s/ẩ/aar/g
	silent! '<,'>s/ẫ/aax/g
	silent! '<,'>s/ậ/aaj/g

	silent! '<,'>s/đ/dd/g

	silent! '<,'>s/è/ef/g
	silent! '<,'>s/é/es/g
	silent! '<,'>s/ẻ/er/g
	silent! '<,'>s/ẽ/ex/g
	silent! '<,'>s/ẹ/ej/g

	silent! '<,'>s/ê/ee/g
	silent! '<,'>s/ê/ee\\/g
	silent! '<,'>s/ề/eef/g
	silent! '<,'>s/ế/ees/g
	silent! '<,'>s/ể/eer/g
	silent! '<,'>s/ễ/eex/g
	silent! '<,'>s/ệ/eej/g

	silent! '<,'>s/ì/if/g
	silent! '<,'>s/í/is/g
	silent! '<,'>s/ỉ/ir/g
	silent! '<,'>s/ĩ/ix/g
	silent! '<,'>s/ị/ij/g

	silent! '<,'>s/ò/of/g
	silent! '<,'>s/ó/os/g
	silent! '<,'>s/ỏ/or/g
	silent! '<,'>s/õ/ox/g
	silent! '<,'>s/ọ/oj/g

	silent! '<,'>s/ô/oo/g
	silent! '<,'>s/ô/oo\\/g
	silent! '<,'>s/ồ/oof/g
	silent! '<,'>s/ố/oos/g
	silent! '<,'>s/ổ/oor/g
	silent! '<,'>s/ỗ/oox/g
	silent! '<,'>s/ộ/ooj/g

	silent! '<,'>s/ơ/ow/g
	silent! '<,'>s/ơ/ow\\/g
	silent! '<,'>s/ờ/owf/g
	silent! '<,'>s/ớ/ows/g
	silent! '<,'>s/ở/owr/g
	silent! '<,'>s/ỡ/owx/g
	silent! '<,'>s/ợ/owj/g

	silent! '<,'>s/ù/uf/g
	silent! '<,'>s/ú/us/g
	silent! '<,'>s/ủ/ur/g
	silent! '<,'>s/ũ/ux/g
	silent! '<,'>s/ụ/uj/g

	silent! '<,'>s/ư/uw/g
	silent! '<,'>s/ư/uw\\/g
	silent! '<,'>s/ừ/uwf/g
	silent! '<,'>s/ứ/uws/g
	silent! '<,'>s/ử/uwr/g
	silent! '<,'>s/ữ/uwx/g
	silent! '<,'>s/ự/uwj/g

	silent! '<,'>s/ỳ/yf/g
	silent! '<,'>s/ý/ys/g
	silent! '<,'>s/ỷ/yr/g
	silent! '<,'>s/ỹ/yx/g
	silent! '<,'>s/ỵ/yj/g
endfunction
