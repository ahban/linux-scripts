""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vundle plugin manager
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" for vundle
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    " alternatively, pass a path where Vundle should install plugins
    "call vundle#begin('~/some/path/here')
    
    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'

    " Plugins
    Plugin 'Valloric/YouCompleteMe'
    Plugin 'morhetz/gruvbox'
    Plugin 'maciakl/vim-neatstatus'
    
    " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" autocmd BufNewFile,BufRead *.cu set filetype=cpp 
" It seems that clang only support cuda c syntax, in order to use c++ syntac, I
" have to set cu and cuh file to c++ filetype
au BufNewFile,BufRead *.cu  set ft=cpp
au BufNewFile,BufRead *.cuh set ft=cpp
let g:ycm_max_diagnostics_to_display = 40

au filetype cuda let g:ycm_global_ycm_extra_conf='${HOME}/.scripts/ycm_conf_cuda.py'
au filetype cpp,python,c  let g:ycm_global_ycm_extra_conf="${HOME}/.scripts/ycm_conf_cpp.py"

let g:ycm_always_populate_location_list = 1

" NERDTREE
Bundle 'scrooloose/nerdtree'
" TAGBAR
Bundle 'majutsushi/tagbar'
" tagbar
" toggle tagbar display
map <F4> :TagbarToggle<CR>
let g:tagbar_ctags_bin='~/soft/ctags/bin/ctags'

" nerdtree
" toggle nerdtree display
map <F3> :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap ,t :NERDTreeFind<CR>
" don't show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '.git', 'tags', 'cscope*']


" shotkeys for Ycm
"nnoremap <F12>   :YcmCompleter GoToDefinition<CR>
"nnoremap <C-F12> :YcmCompleter GoToDeclaration<CR>
nnoremap ff :YcmCompleter FixIt<CR>
nnoremap <F12> :YcmCompleter GoTo<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" miscellaneous settings 
set encoding=utf-8
language en_US.utf8
set nocompatible
set mouse=a
set noswapfile
au filetype tex,plaintex setlocal nowrap

colorscheme gruvbox 

" split windows
set splitbelow
set splitright
" window navigation
nnoremap <C-j> <C-w><C-j>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-k> <C-w><C-k>

" set viminfo
set viminfo='10000,<10000,s10000,h 

set number

" indent with 4 spaces 
set shiftwidth=4 tabstop=4 expandtab
au filetype make setlocal tabstop=4 shiftwidth=4
" help cinoptions-values
au filetype cpp,cuda,c setlocal cino=g0.5s,N-s,:2,E-s

" mark the colmn width 
au filetype markdown,tex,plaintex,cuda,make,cpp,python,c,sh,matlab setlocal colorcolumn=80,120
set textwidth=79

" fold stuff
au filetype vim,cuda,cpp,c,tex,plaintex,sh,python,make,matlab setlocal foldmethod=indent
set foldnestmax=4
"set nofoldenable
"set foldignore=
"set foldlevel=3
nnoremap <space> za

" go to the line that last time modified
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  au BufReadPost * normal zz
endif

" search setting
set history=10000
set hlsearch
set incsearch

" status bar
set laststatus=2
set cmdheight=2
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

if exists('+syntax')
    syntax on
endif
if v:version >= 800
    set backspace=indent,eol,start
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" auto insert code
au BufNewFile *.tex,*.cpp,*.py,*.cc,*.c,*.h,*.hpp,*.cu,*.cuh,*.sh,*.java exec ":call SetTitle()" 
func SetTitle() 
    let fileext = expand("%:e")
    let l:years = '(2018)'
    if strftime('%Y') != '2018'
        let l:years = "(2018-" . strftime("%Y") . ")"
    endif
    if (&filetype=='sh' || &filetype=='python') 
        if &filetype == 'sh'
            call setline(1, "\#!/bin/bash") 
        else
            call setline(1, "\#!python") 
        endif
        call append(line(".")+0, "\###############################################################################") 
        call append(line(".")+1, "\# file name    : ".expand("%")) 
        call append(line(".")+2, "\# authors      : Ban Zhihua" . l:years) 
        call append(line(".")+3, "\# contact      : sawpara@126.com") 
        call append(line(".")+4, "\# created time : ".strftime("%c", localtime())) 
        call append(line(".")+5, "\###############################################################################") 
        call append(line(".")+6, "") 
    elseif 'tex' == &filetype || 'plaintex' == &filetype
        call setline(1,          repeat("%", 79))
        call append(line("."),   "%   file name    : ".expand("%")) 
        call append(line(".")+1, "%   authors      : Ban Zhihua" . l:years) 
        call append(line(".")+2, "%   contact      : sawpara@126.com") 
        call append(line(".")+3, "%   created time : ".strftime("%c", localtime())) 
        call append(line(".")+4, repeat("%", 79)) 
        call append(line(".")+5, "")
        call append(line(".")+6, "\\documentclass{ctexart}")
        call append(line(".")+7, "\\begin{document}")
        call append(line(".")+8, "\\end{document}")
    else 
        call setline(1,          "/******************************************************************************") 
        call append(line("."),   "  > file name    : ".expand("%")) 
        call append(line(".")+1, "  > authors      : Ban Zhihua" . l:years) 
        call append(line(".")+2, "  > contact      : sawpara@126.com") 
        call append(line(".")+3, "  > created time : ".strftime("%c", localtime())) 
        call append(line(".")+4, "******************************************************************************/") 
        call append(line(".")+5, "")
    endif
    if &filetype == 'cpp' && fileext != 'h' && fileext != 'cu' && fileext != 'cuh'
        call append(line(".")+6, "#include <iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include <stdio.h>")
        call append(line(".")+7, "#include <stdlib.h>")
        call append(line(".")+8, "")
    endif
    if &filetype == 'cuda' && fileext != 'cuh'
        call append(line(".")+6, '#include "device_launch_parameters.h"')
        call append(line(".")+7, "#include <cstdlib>")
        call append(line(".")+8, "")
    endif
    if fileext == 'h' || fileext == 'cuh'
        "let l:macname = toupper(expand("%:r"))
        let l:macname = toupper(expand("%"))
        let l:macname = substitute(l:macname, "-", "_", "g")
        let l:macname = substitute(l:macname, "\\.", "_", "g")
        let l:macname = substitute(l:macname, "/", "_", "g")
        let l:macname = substitute(l:macname, "^", "__", "g")
        let l:macname = substitute(l:macname, "$", "__", "g")
        call append(line(".")+6, join(["#ifndef ", l:macname      ], ""))
        call append(line(".")+7, join(["#define ", l:macname, " 1"], ""))
        call append(line(".")+8, "")
        call append(line(".")+9, "#endif // end " . l:macname)
        call cursor(line(".")+8, 0)
        return
    endif
    call cursor(line("$"), 0)
endfunc 
"au BufNewFile * normal G

nnoremap <C-k><C-i> :call InsertComments()<CR>
func InsertComments()
    let l:indent_width=indent(line('.'))
    if &filetype == 'cpp' || &filetype=='c' || &filetype=='cuda'
        call append(line('.')-1, repeat(' ', l:indent_width).repeat('/', 80-1-l:indent_width))
        call append(line('.')-1, repeat(' ', l:indent_width)."// ")
        return
    endif
    if &filetype == 'vim'
        call append(line('.')-1, repeat(' ', l:indent_width).repeat('"', 80-1-l:indent_width))
        call append(line('.')-1, repeat(' ', l:indent_width).'"')
        return
    endif
    if &filetype == 'sh' || &filetype == 'python'
        call append(line('.')-1, repeat(' ', l:indent_width).repeat('#', 80-1-l:indent_width))
        call append(line('.')-1, repeat(' ', l:indent_width).'#')
        return
    endif
    if &filetype == 'tex' || &filetype == 'plaintex'
        call append(line('.')-1, repeat(' ', l:indent_width).repeat('%', 80-1-l:indent_width))
        call append(line('.')-1, repeat(' ', l:indent_width).'%')
        return
    endif
endfunc

nnoremap <C-F5> :call CompileMe()<CR>

func CompileMe()
    silent write
    " latex compile
    if &filetype == 'tex' || &filetype == 'plaintex'
        silent let log = system('rm -rf '.expand("%:p:r").'.aux')
        silent let log = system('rm -rf '.expand("%:p:r").'.log')
        for line_number in range(1, line('$'))
            let     line_str = getline(line_number)
            let  matched_str = matchstr(line_str, '^\s*[^%]\s*documentclass\s*\(\[.*\]\)\?\s*\({.*}\)')
            let  matched_str = matchstr(matched_str, '\({\s*.*\s*}\)')
            let  matched_str = matchstr(matched_str, '\a\+')
            if !empty(matched_str)
                if 'ctexart' == matched_str || 'ctexrep' == matched_str || 'ctexbook' == matched_str || 'ctexbeamer' == matched_str
                    silent let log = system('xelatex -shell-escape ' . expand('%'))
                else
                    silent let log = system('pdflatex '.expand('%'))
                endif
                if v:shell_error == 0
                    silent let l = system('evince '.expand("%:p:r").".pdf &")
                    echo "Success"
                else
                    echo log
                    echo "Failed"
                endif
                return
            endif
        endfor
    endif
    " python
    if &filetype == 'python'
        echo system('python '.expand("%:p"))
    endif
    " c++ / cuda / c
    if &filetype == 'cpp' || &filetype == 'cuda' || &filetype == 'c'
        echo system("make")
    endif
endfunc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "          FILE: restore_view.vim
    "      Language: vim script
    "    Maintainer: Yichao Zhou (broken.zhou AT gmail dot com)
    "       Version: 1.3
    "   Description: 
    "       This is a simple script to autosave cursor position and fold
    "       information using vim's mkview.  Although you can easily do this job by
    "       just add serveral line to {.,_}vimrc, write a script plugin can make it
    "       more clean and nice.  We assume you use a new enough Vim to enjoy
    "       these feature. Hope you love it:)
    "
    "       Views will be saved when you save/write a file or EXIT VIM.
    "
    " Suggested Setting:
    "       Please put them in you vimrc file.
    "           set viewoptions=cursor,folds,slash,unix
    "       
    "       Set it in a plugin file looks dirty to me.  So you'd better do it your
    "       self.  This only keywords not in viewoptions is "options". I believe it
    "       does not belong to a view.  If you think you need it, feel free to
    "       put it in.  If you do not want views of some files to be saved, please
    "       set g:loaded_restore_view. The longer time you use, the bigger view
    "       folder you will have.  So if you use UNIX environment, you may need to
    "       use cron to do some clean job.
    "
    "       Most of code is from wiki.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set viewoptions=cursor,folds,slash,unix 
" let g:skipview_files = ['*\.vim'] 

if exists("g:loaded_restore_view")
    finish
endif
let g:loaded_restore_view = 1

if !exists("g:skipview_files")
    let g:skipview_files = []
endif

function! MakeViewCheck()
    if &l:diff | return 0 | endif
    if &buftype != '' | return 0 | endif
    if expand('%') =~ '\[.*\]' | return 0 | endif
    if empty(glob(expand('%:p'))) | return 0 | endif
    if &modifiable == 0 | return 0 | endif
    if len($TEMP) && expand('%:p:h') == $TEMP | return 0 | endif
    if len($TMP) && expand('%:p:h') == $TMP | return 0 | endif

    let file_name = expand('%:p')
    for ifiles in g:skipview_files
        if file_name =~ ifiles
            return 0
        endif
    endfor

    return 1
endfunction

augroup AutoView
    autocmd!
    " Autosave & Load Views.
    autocmd BufWritePre,BufWinLeave ?* if MakeViewCheck() | silent! mkview | endif
    autocmd BufWinEnter ?* if MakeViewCheck() | silent! loadview | endif
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " VIM on ubuntu 18.04
    "  VIM - Vi IMproved 8.0 (2016 Sep 12, compiled Apr 10 2018 21:31:58)
    "  Included patches: 1-1453
    "  Modified by pkg-vim-maintainers@lists.alioth.debian.org
    "  Compiled by pkg-vim-maintainers@lists.alioth.debian.org
    "  Huge version without GUI.  Features included (+) or not (-):
    "  +acl               +farsi             +mouse_sgr         -tag_any_white
    "  +arabic            +file_in_path      -mouse_sysmouse    -tcl
    "  +autocmd           +find_in_path      +mouse_urxvt       +termguicolors
    "  -autoservername    +float             +mouse_xterm       +terminal
    "  -balloon_eval      +folding           +multi_byte        +terminfo
    "  +balloon_eval_term -footer            +multi_lang        +termresponse
    "  -browse            +fork()            -mzscheme          +textobjects
    "  ++builtin_terms    +gettext           +netbeans_intg     +timers
    "  +byte_offset       -hangul_input      +num64             +title
    "  +channel           +iconv             +packages          -toolbar
    "  +cindent           +insert_expand     +path_extra        +user_commands
    "  -clientserver      +job               -perl              +vertsplit
    "  -clipboard         +jumplist          +persistent_undo   +virtualedit
    "  +cmdline_compl     +keymap            +postscript        +visual
    "  +cmdline_hist      +lambda            +printer           +visualextra
    "  +cmdline_info      +langmap           +profile           +viminfo
    "  +comments          +libcall           -python            +vreplace
    "  +conceal           +linebreak         +python3           +wildignore
    "  +cryptv            +lispindent        +quickfix          +wildmenu
    "  +cscope            +listcmds          +reltime           +windows
    "  +cursorbind        +localmap          +rightleft         +writebackup
    "  +cursorshape       -lua               -ruby              -X11
    "  +dialog_con        +menu              +scrollbind        -xfontset
    "  +diff              +mksession         +signs             -xim
    "  +digraphs          +modify_fname      +smartindent       -xpm
    "  -dnd               +mouse             +startuptime       -xsmp
    "  -ebcdic            -mouseshape        +statusline        -xterm_clipboard
    "  +emacs_tags        +mouse_dec         -sun_workshop      -xterm_save
    "  +eval              +mouse_gpm         +syntax            
    "  +ex_extra          -mouse_jsbterm     +tag_binary        
    "  +extra_search      +mouse_netterm     +tag_old_static    
    "     system vimrc file: "$VIM/vimrc"
    "       user vimrc file: "$HOME/.vimrc"
    "   2nd user vimrc file: "~/.vim/vimrc"
    "        user exrc file: "$HOME/.exrc"
    "         defaults file: "$VIMRUNTIME/defaults.vim"
    "    fall-back for $VIM: "/usr/share/vim"
    "  Compilation: gcc -c -I. -Iproto -DHAVE_CONFIG_H   -Wdate-time  -g -O2 -fdebug-prefix-map=/build/vim-NQEcoP/vim-8.0.1453=. -fstack-protector-strong -Wformat -Werror=format-security -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=1       
    "  Linking: gcc   -Wl,-Bsymbolic-functions -Wl,-z,relro -Wl,-z,now -Wl,--as-needed -o vim        -lm -ltinfo -lnsl  -lselinux  -lacl -lattr -lgpm -ldl     -L/usr/lib/python3.6/config-3.6m-x86_64-linux-gnu -lpython3.6m -lpthread -ldl -lutil -lm      
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Install Vim 8.1 on 3.10.0-514.26.2.el7.x86_64
    " 1. Download vim-8.1.tar.bz2 from https://ftp.nluug.nl/pub/vim/unix/ 
    " 2. extract vim81 
    " 3. Download ncurses from https://ftp.gnu.org/gnu/ncurses/
    " 4. Install ncurses into home path 
    "   ./configure --prefix=${HOME}/soft/ncurses; make -j 5 ; make install
    "
    " 5. Download Python3 from 
    "   https://www.python.org/ftp/python/3.6.7/Python-3.6.7.tar.xz
    "   TODO try miniconda3 instead of python3 or anaconda3 and goto step 9
    " 6. Install Python3 into home path
    "   ./configure --prefix=${HOME}/soft/python3 
    "   --enable-optimizations --enable-shared
    "   make -j 5; make install 
    " 7. [important] change directory into 
    "   ${HOME}/soft/python3/lib/python3.6/config-3.6m-x86_64-linux-gnu
    "   ln -s ../../libpython3.6m.so libpython3.6m.so 
    " 8. add relative paths into bashrc
    "   export PATH=${HOME}/soft/python3/bin:${PATH}
    "   export LD_LIBRARY_PATH=${HOME}/soft/python3/lib:${LD_LIBRARY_PATH}
    " 9. Install vim using the following configuration.
    "   LDFLAGS=-L${HOME}/soft/ncurses/lib \
    "   ./configure \
    "     --prefix=${HOME}/soft/vim \
    "     --enable-gui=no --disable-nls \
    "     --with-features=huge --enable-cscope --enable-multibyte --with-tlib=ncurses \
    "     --enable-python3interp=yes \
    "     --with-python3-command=python3 \ 
    "     --with-python3-config-dir=${HOME}/soft/python3/lib/python3.6/config-3.6m-x86_64-linux-gnu \
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
