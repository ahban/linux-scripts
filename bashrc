# .bashrc

###############################################################################
# color prompt

#export PS1="\e[0;32m\u@\h:\e[0;33m\w\e[0m\$ "
if [ "Ubuntu" != "$(cat /proc/version | grep -o Ubuntu | head -1 | sed 's| *||')" ]; then
    export PS1="\033[01;32m\u@\h\033[00m:\033[01;33m\w\033[00m\$ "
fi

###############################################################################
# alias 

alias ll='ls -lah --color=auto'
alias 24-3='ssh 24-3'
alias sun='ssh sun'

###############################################################################
# PATH
PATHS=(\
    # python 2
    #"${HOME}/soft/anaconda2/bin" 
    #"${HOME}/soft/python2/bin"

    # python 3
    #"${HOME}/soft/python3/bin"
    "${HOME}/soft/anaconda3/bin" 
    "${HOME}/soft/miniconda3/bin" 
    
    # ncurses for compiled vim8.1
    "${HOME}/soft/ncurses/bin"
    
    # compiled local vim. refer the end of vimrc to see how to compile vim
    "${HOME}/soft/vim/bin"

    # general local bin
    "${HOME}/soft/bin"
)

for (( i = 0; i < ${#PATHS[@]}; i++ )); do
    cur_path=${PATHS[$i]} 
    if [[ -d ${cur_path} ]]; then
        if [[ -z "$(echo $PATH | grep -o ${cur_path})" ]]; then 
            echo "exporting : ${cur_path}"
            export PATH=${cur_path}:${PATH}
        fi
    fi
done
unset PATHS

###############################################################################
# LD_LIBRARY_PATH
LIBS=(\
    "${HOME}/soft/ncurses/lib"
    "${HOME}/soft/python2/lib"
    "${HOME}/soft/anaconda2/lib"
    "${HOME}/soft/python3/lib"
    "${HOME}/soft/anaconda3/lib"
)

for (( i = 0; i < ${#LIBS[@]}; i++ )); do
    cur_path=${LIBS[$i]} 
    if [[ -d ${cur_path} ]]; then
        if [[ -z "$(echo $LD_LIBRARY_PATH | grep -o ${cur_path})" ]]; then 
            echo "exporting LIB : ${cur_path}"
            export LD_LIBRARY_PATH=${cur_path}:${LD_LIBRARY_PATH}
        fi
    fi
done
unset LIBS

######################################################################
# MANPATH
MANS=(\
    "${HOME}/soft/vim/share/man"
    "${HOME}/soft/share/man"
)

for (( i = 0; i < ${#MANS[@]}; i++ )); do
    cur_path=${MANS[$i]} 
    if [[ -d ${cur_path} ]]; then
        if [[ -z "$(echo $MANPATH | grep -o ${cur_path})" ]]; then 
            echo "exporting MANPATH : ${cur_path}"
            export MANPATH=${cur_path}:${MANPATH}
        fi
    fi
done

unset MANS
######################################################################
# PKG_CONFIG_PATH

export PKG_CONFIG_PATH=/usr/local/cuda/pkgconfig:$PKG_CONFIG_PATH

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
