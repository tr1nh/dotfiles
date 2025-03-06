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

" add more register size in viminfo
set viminfo='100,<1000,s100,h

" ui
set laststatus=0
set wildmenu

" search
set incsearch
set ignorecase

" default shell for terminal mode
set shell=/bin/bash

" encoding
set encoding=utf-8

" Set path for quickly find an item in cwd:
set path+=**

" indentation
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

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
nnoremap <Leader>k0 :set keymap=<CR>
nnoremap <Leader>kq :set keymap=vietnamese-viqr_utf-8<CR>
nnoremap <Leader>kt :set keymap=vietnamese-telex_utf-8<CR>
nnoremap <Leader>kv :set keymap=vietnamese-vni_utf-8<CR>
inoremap <Leader>k0 <ESC>:set keymap=<CR>a
inoremap <Leader>kq <ESC>:set keymap=vietnamese-viqr_utf-8<CR>a
inoremap <Leader>kt <ESC>:set keymap=vietnamese-telex_utf-8<CR>a
inoremap <Leader>kv <ESC>:set keymap=vietnamese-vni_utf-8<CR>a

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
nnoremap <Leader>ir :%retab!<CR>
vnoremap <Leader>ir :retab!<CR>
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

" map register
nnoremap <Leader>ra ggVG"ay
nnoremap <Leader>rb ggVG"by
nnoremap <Leader>rc ggVG"cy
nnoremap <Leader>rd ggVG"dy
nnoremap <Leader>re ggVG"ey
nnoremap <Leader>rf ggVG"fy
nnoremap <Leader>rg ggVG"gy
nnoremap <Leader>rh ggVG"hy
nnoremap <Leader>ri ggVG"iy
nnoremap <Leader>rj ggVG"jy
nnoremap <Leader>rk ggVG"ky
nnoremap <Leader>rl ggVG"ly
nnoremap <Leader>rm ggVG"my
nnoremap <Leader>rn ggVG"ny
nnoremap <Leader>ro ggVG"oy
nnoremap <Leader>rp ggVG"py
nnoremap <Leader>rq ggVG"qy
nnoremap <Leader>rr ggVG"ry
nnoremap <Leader>rs ggVG"sy
nnoremap <Leader>rt ggVG"ty
nnoremap <Leader>ru ggVG"uy
nnoremap <Leader>rv ggVG"vy
nnoremap <Leader>rw ggVG"wy
nnoremap <Leader>rx ggVG"xy
nnoremap <Leader>ry ggVG"yy
nnoremap <Leader>rz ggVG"zy

nnoremap <Leader>rA ggVG"Ay
nnoremap <Leader>rB ggVG"By
nnoremap <Leader>rC ggVG"Cy
nnoremap <Leader>rD ggVG"Dy
nnoremap <Leader>rE ggVG"Ey
nnoremap <Leader>rF ggVG"Fy
nnoremap <Leader>rG ggVG"Gy
nnoremap <Leader>rH ggVG"Hy
nnoremap <Leader>rI ggVG"Iy
nnoremap <Leader>rJ ggVG"Jy
nnoremap <Leader>rK ggVG"Ky
nnoremap <Leader>rL ggVG"Ly
nnoremap <Leader>rM ggVG"My
nnoremap <Leader>rN ggVG"Ny
nnoremap <Leader>rO ggVG"Oy
nnoremap <Leader>rP ggVG"Py
nnoremap <Leader>rQ ggVG"Qy
nnoremap <Leader>rR ggVG"Ry
nnoremap <Leader>rS ggVG"Sy
nnoremap <Leader>rT ggVG"Ty
nnoremap <Leader>rU ggVG"Uy
nnoremap <Leader>rV ggVG"Vy
nnoremap <Leader>rW ggVG"Wy
nnoremap <Leader>rX ggVG"Xy
nnoremap <Leader>rY ggVG"Yy
nnoremap <Leader>rZ ggVG"Zy

vnoremap <Leader>ra "ay
vnoremap <Leader>rb "by
vnoremap <Leader>rc "cy
vnoremap <Leader>rd "dy
vnoremap <Leader>re "ey
vnoremap <Leader>rf "fy
vnoremap <Leader>rg "gy
vnoremap <Leader>rh "hy
vnoremap <Leader>ri "iy
vnoremap <Leader>rj "jy
vnoremap <Leader>rk "ky
vnoremap <Leader>rl "ly
vnoremap <Leader>rm "my
vnoremap <Leader>rn "ny
vnoremap <Leader>ro "oy
vnoremap <Leader>rp "py
vnoremap <Leader>rq "qy
vnoremap <Leader>rr "ry
vnoremap <Leader>rs "sy
vnoremap <Leader>rt "ty
vnoremap <Leader>ru "uy
vnoremap <Leader>rv "vy
vnoremap <Leader>rw "wy
vnoremap <Leader>rx "xy
vnoremap <Leader>ry "yy
vnoremap <Leader>rz "zy

vnoremap <Leader>rA "Ay
vnoremap <Leader>rB "By
vnoremap <Leader>rC "Cy
vnoremap <Leader>rD "Dy
vnoremap <Leader>rE "Ey
vnoremap <Leader>rF "Fy
vnoremap <Leader>rG "Gy
vnoremap <Leader>rH "Hy
vnoremap <Leader>rI "Iy
vnoremap <Leader>rJ "Jy
vnoremap <Leader>rK "Ky
vnoremap <Leader>rL "Ly
vnoremap <Leader>rM "My
vnoremap <Leader>rN "Ny
vnoremap <Leader>rO "Oy
vnoremap <Leader>rP "Py
vnoremap <Leader>rQ "Qy
vnoremap <Leader>rR "Ry
vnoremap <Leader>rS "Sy
vnoremap <Leader>rT "Ty
vnoremap <Leader>rU "Uy
vnoremap <Leader>rV "Vy
vnoremap <Leader>rW "Wy
vnoremap <Leader>rX "Xy
vnoremap <Leader>rY "Yy
vnoremap <Leader>rZ "Zy

" macos vim doesn't support keymap
nnoremap <Leader>vt ggVG:call VTelex()<CR>
nnoremap <Leader>vu ggVG:call UnTelex()<CR>
nnoremap <Leader>vn ggVG:call NoVietnamese()<CR>
vnoremap <Leader>vt :<C-u>call VTelex()<CR>
vnoremap <Leader>vu :<C-u>call UnTelex()<CR>
vnoremap <Leader>vn :<C-u>call NoVietnamese()<CR>
inoremap <Leader>v <ESC>V:call VTelex()<CR>A

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

function! NoVietnamese()
	silent! '<,'>s/À/A/g
	silent! '<,'>s/Á/A/g
	silent! '<,'>s/Ả/A/g
	silent! '<,'>s/Ã/A/g
	silent! '<,'>s/Ạ/A/g

	silent! '<,'>s/Ă/A/g
	silent! '<,'>s/Ă/A/g
	silent! '<,'>s/Ằ/A/g
	silent! '<,'>s/Ắ/A/g
	silent! '<,'>s/Ẳ/A/g
	silent! '<,'>s/Ẵ/A/g
	silent! '<,'>s/Ặ/A/g

	silent! '<,'>s/Â/A/g
	silent! '<,'>s/Â/A/g
	silent! '<,'>s/Ầ/A/g
	silent! '<,'>s/Ấ/A/g
	silent! '<,'>s/Ẩ/A/g
	silent! '<,'>s/Ẫ/A/g
	silent! '<,'>s/Ậ/A/g

	silent! '<,'>s/Đ/D/g

	silent! '<,'>s/E/E/g
	silent! '<,'>s/È/E/g
	silent! '<,'>s/É/E/g
	silent! '<,'>s/Ẻ/E/g
	silent! '<,'>s/Ẽ/E/g
	silent! '<,'>s/Ẹ/E/g

	silent! '<,'>s/Ê/E/g
	silent! '<,'>s/Ê/E/g
	silent! '<,'>s/Ề/E/g
	silent! '<,'>s/Ế/E/g
	silent! '<,'>s/Ể/E/g
	silent! '<,'>s/Ễ/E/g
	silent! '<,'>s/Ệ/E/g

	silent! '<,'>s/Ì/I/g
	silent! '<,'>s/Í/I/g
	silent! '<,'>s/Ỉ/I/g
	silent! '<,'>s/Ĩ/I/g
	silent! '<,'>s/Ị/I/g

	silent! '<,'>s/Ò/O/g
	silent! '<,'>s/Ó/O/g
	silent! '<,'>s/Ỏ/O/g
	silent! '<,'>s/Õ/O/g
	silent! '<,'>s/Ọ/O/g

	silent! '<,'>s/Ô/O/g
	silent! '<,'>s/Ô/O/g
	silent! '<,'>s/Ồ/O/g
	silent! '<,'>s/Ố/O/g
	silent! '<,'>s/Ổ/O/g
	silent! '<,'>s/Ỗ/O/g
	silent! '<,'>s/Ộ/O/g

	silent! '<,'>s/Ơ/O/g
	silent! '<,'>s/Ơ/O/g
	silent! '<,'>s/Ờ/O/g
	silent! '<,'>s/Ớ/O/g
	silent! '<,'>s/Ở/O/g
	silent! '<,'>s/Ỡ/O/g
	silent! '<,'>s/Ợ/O/g

	silent! '<,'>s/Ù/U/g
	silent! '<,'>s/Ú/U/g
	silent! '<,'>s/Ủ/U/g
	silent! '<,'>s/Ũ/U/g
	silent! '<,'>s/Ụ/U/g

	silent! '<,'>s/Ư/U/g
	silent! '<,'>s/Ư/U/g
	silent! '<,'>s/Ừ/U/g
	silent! '<,'>s/Ứ/U/g
	silent! '<,'>s/Ử/U/g
	silent! '<,'>s/Ữ/U/g
	silent! '<,'>s/Ự/U/g

	silent! '<,'>s/Ỳ/Y/g
	silent! '<,'>s/Ý/Y/g
	silent! '<,'>s/Ỷ/Y/g
	silent! '<,'>s/Ỹ/Y/g
	silent! '<,'>s/Ỵ/Y/g

	silent! '<,'>s/à/a/g
	silent! '<,'>s/á/a/g
	silent! '<,'>s/ả/a/g
	silent! '<,'>s/ã/a/g
	silent! '<,'>s/ạ/a/g

	silent! '<,'>s/ă/a/g
	silent! '<,'>s/ă/a/g
	silent! '<,'>s/ằ/a/g
	silent! '<,'>s/ắ/a/g
	silent! '<,'>s/ẳ/a/g
	silent! '<,'>s/ẵ/a/g
	silent! '<,'>s/ặ/a/g

	silent! '<,'>s/â/a/g
	silent! '<,'>s/â/a/g
	silent! '<,'>s/ầ/a/g
	silent! '<,'>s/ấ/a/g
	silent! '<,'>s/ẩ/a/g
	silent! '<,'>s/ẫ/a/g
	silent! '<,'>s/ậ/a/g

	silent! '<,'>s/đ/d/g

	silent! '<,'>s/è/e/g
	silent! '<,'>s/é/e/g
	silent! '<,'>s/ẻ/e/g
	silent! '<,'>s/ẽ/e/g
	silent! '<,'>s/ẹ/e/g

	silent! '<,'>s/ê/e/g
	silent! '<,'>s/ê/e/g
	silent! '<,'>s/ề/e/g
	silent! '<,'>s/ế/e/g
	silent! '<,'>s/ể/e/g
	silent! '<,'>s/ễ/e/g
	silent! '<,'>s/ệ/e/g

	silent! '<,'>s/ì/i/g
	silent! '<,'>s/í/i/g
	silent! '<,'>s/ỉ/i/g
	silent! '<,'>s/ĩ/i/g
	silent! '<,'>s/ị/i/g

	silent! '<,'>s/ò/o/g
	silent! '<,'>s/ó/o/g
	silent! '<,'>s/ỏ/o/g
	silent! '<,'>s/õ/o/g
	silent! '<,'>s/ọ/o/g

	silent! '<,'>s/ô/o/g
	silent! '<,'>s/ô/o/g
	silent! '<,'>s/ồ/o/g
	silent! '<,'>s/ố/o/g
	silent! '<,'>s/ổ/o/g
	silent! '<,'>s/ỗ/o/g
	silent! '<,'>s/ộ/o/g

	silent! '<,'>s/ơ/o/g
	silent! '<,'>s/ơ/o/g
	silent! '<,'>s/ờ/o/g
	silent! '<,'>s/ớ/o/g
	silent! '<,'>s/ở/o/g
	silent! '<,'>s/ỡ/o/g
	silent! '<,'>s/ợ/o/g

	silent! '<,'>s/ù/u/g
	silent! '<,'>s/ú/u/g
	silent! '<,'>s/ủ/u/g
	silent! '<,'>s/ũ/u/g
	silent! '<,'>s/ụ/u/g

	silent! '<,'>s/ư/u/g
	silent! '<,'>s/ư/u/g
	silent! '<,'>s/ừ/u/g
	silent! '<,'>s/ứ/u/g
	silent! '<,'>s/ử/u/g
	silent! '<,'>s/ữ/u/g
	silent! '<,'>s/ự/u/g

	silent! '<,'>s/ỳ/y/g
	silent! '<,'>s/ý/y/g
	silent! '<,'>s/ỷ/y/g
	silent! '<,'>s/ỹ/y/g
	silent! '<,'>s/ỵ/y/g
endfunction
