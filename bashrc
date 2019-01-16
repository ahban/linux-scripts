# .bashrc

###############################################################################
# color prompt

# read the following link could help you to set your own PS1 
# https://unix.stackexchange.com/questions/105958/terminal-prompt-not-wrapping-correctly
#export PS1="\e[0;32m\u@\h:\e[0;33m\w\e[0m\$ "
if [ "Ubuntu" != "$(cat /proc/version | grep -o Ubuntu | head -1 | sed 's| *||')" ]; then
    export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;33m\]\w\[\033[00m\]\$ "
    #export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
fi

###############################################################################
# alias 

alias ll='ls -lah --color=auto'
alias 24-3='ssh 24-3'
alias sun='ssh sun'
alias coding='ssh coding'
export LC_TIME=en_US.UTF-8

###############################################################################
# PATH
PATHS=(\
    # python 2
    #"${HOME}/soft/anaconda2/bin"
    #"${HOME}/soft/python2/bin"

    # python 3
    "${HOME}/soft/python3/bin"
    "${HOME}/soft/anaconda3/bin"
    "${HOME}/soft/miniconda3/bin"
    
    # ncurses for compiled vim8.1
    "${HOME}/soft/ncurses/bin"
    
    # compiled local vim. refer the end of vimrc to see how to compile vim
    "${HOME}/soft/vim/bin"

    # general local bin
    "${HOME}/soft/bin"

    # new projects
    "${HOME}/.scripts/bin"
    
    # cuda
    #"${HOME}/soft/cuda-10.0/bin"
    "${HOME}/soft/cuda-8.0/bin"

    # git 
    "${HOME}/soft/git-2.18.1/bin"

    # texlive 
    "${HOME}/soft/texlive/2017/bin/x86_64-linux"

    # tmux
    "${HOME}/soft/tmux-2.8/bin"

    # htop
    "${HOME}/soft/htop-2.2.0/bin"
)

for (( i = 0; i < ${#PATHS[@]}; i++ )); do
    cur_path=${PATHS[$i]}
    if [[ -d ${cur_path} ]]; then
        if [[ -z "$(echo $PATH | grep -o ${cur_path})" ]]; then
            #echo "exporting PATH : ${cur_path}"
            export PATH=${cur_path}:${PATH}
        fi
    fi
done
unset PATHS

###############################################################################
# LD_LIBRARY_PATH
LIBS=(\
    "${HOME}/soft/ncurses/lib"
    
    "${HOME}/soft/cuda-8.0/lib64"
    "${HOME}/soft/cuda-10.0/lib64"

    "${HOME}/soft/libevent-2.1.8/lib"

    #"${HOME}/soft/python2/lib"
    #"${HOME}/soft/anaconda2/lib"
    "${HOME}/soft/python3/lib"
    #"${HOME}/soft/anaconda3/lib"
    #"${HOME}/soft/miniconda3/lib"
    "${HOME}/devel/asgd/readonly/asgd_git/lib"

    #"${HOME}/devel/kaldi-no-lda-tests/kaldi-master/tools/openfst/lib"
    #"${HOME}/devel/kaldi-no-lda-tests/kaldi-master/src/lib"
    "${HOME}/soft/kaldi-copy/lib"
    "${HOME}/soft/openfst-copy/lib"
)

for (( i = 0; i < ${#LIBS[@]}; i++ )); do
    cur_path=${LIBS[$i]}
    if [[ -d ${cur_path} ]]; then
        if [[ -z "$(echo $LD_LIBRARY_PATH | grep -o ${cur_path})" ]]; then
            #echo "exporting LIB : ${cur_path}"
            export LD_LIBRARY_PATH=${cur_path}:${LD_LIBRARY_PATH}
        fi
    fi
done
unset LIBS

###############################################################################
# LD_RUN_PATH
LIBS=(\
    "${HOME}/soft/libevent-2.1.8/lib"
)

for (( i = 0; i < ${#LIBS[@]}; i++ )); do
    cur_path=${LIBS[$i]}
    if [[ -d ${cur_path} ]]; then
        if [[ -z "$(echo $LD_RUN_PATH | grep -o ${cur_path})" ]]; then
            #echo "exporting LIB : ${cur_path}"
            export LD_RUN_PATH=${cur_path}:${LD_RUN_PATH}
        fi
    fi
done
unset LIBS

###############################################################################
# MANPATH
MANS=(\
    "${HOME}/soft/vim/share/man"
    "${HOME}/soft/share/man"
    "${HOME}/soft/texlive/2017/texmf-dist/doc/man"
    "${HOME}/soft/tmux-2.8/share/man"
    "${HOME}/soft/htop-2.2.0/share/man"
)

for (( i = 0; i < ${#MANS[@]}; i++ )); do
    cur_path=${MANS[$i]}
    if [[ -d ${cur_path} ]]; then
        if [[ -z "$(echo $MANPATH | grep -o ${cur_path})" ]]; then
            #echo "exporting MANPATH : ${cur_path}"
            export MANPATH=${cur_path}:${MANPATH}
        fi
    fi
done
unset MANS

###############################################################################
# INFOPATH
INFS=(\
    "${HOME}/soft/texlive/2017/texmf-dist/doc/info"
)

for (( i = 0; i < ${#INFS[@]}; i++ )); do
    cur_path=${INFS[$i]}
    if [[ -d ${cur_path} ]]; then
        if [[ -z "$(echo $INFOPATH | grep -o ${cur_path})" ]]; then
            #echo "exporting INFOPATH: ${cur_path}"
            export INFOPATH=${cur_path}:${INFOPATH}
        fi
    fi
done
unset INFOPATH


###############################################################################
# PKG_CONFIG_PATH
PKGS=(\
    "/usr/local/cuda/pkgconfig"
    "${HOME}/soft/cuda-8.0/pkgconfig"
    "${HOME}/soft/cuda-10.0/pkgconfig"
)

for (( i = 0; i < ${#PKGS[@]}; i++ )); do
    cur_path=${PKGS[$i]}
    if [[ -d ${cur_path} ]]; then
        if [[ -z "$(echo $PKG_CONFIG_PATH | grep -o ${cur_path})" ]]; then 
            #echo "exporting PKG_CONFIG_PATH: ${cur_path}"
            export PKG_CONFIG_PATH=${cur_path}:${PKG_CONFIG_PATH}
        fi
    fi
done
unset PKGS

# added by Anaconda2 5.3.1 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
##### __conda_setup="$(CONDA_REPORT_ERRORS=false '${HOME}/soft/anaconda2/bin/conda' shell.bash hook 2> /dev/null)"
##### if [ $? -eq 0 ]; then
#####     \eval "$__conda_setup"
##### else
#####     if [ -f "${HOME}/soft/anaconda2/etc/profile.d/conda.sh" ]; then
#####         . "${HOME}/soft/anaconda2/etc/profile.d/conda.sh"
#####         CONDA_CHANGEPS1=false conda activate base
#####     else
#####         \export PATH="${HOME}/soft/anaconda2/bin:$PATH"
#####     fi
##### fi
##### unset __conda_setup
# <<< conda init <<<
