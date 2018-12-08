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
    
    # ncurses for compiled vim8.1
    "${HOME}/soft/ncurses/bin"
    
    # compiled local vim. refer the end of vimrc to see how to compile vim
    "${HOME}/soft/vim/bin"
)

for (( i = 0; i < ${#PATHS[@]}; i++ )); do
    if [[ -d ${PATHS[$i]} ]]; then
        echo "exporting : ${PATHS[$i]}"
        export PATH=${PATHS[$i]}:${PATH}
    fi
done

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
    if [[ -d ${LIBS[$i]} ]]; then
        echo "exporting LIB : ${LIBS[$i]}"
        export LD_LIBRARY_PATH=${LIBS[$i]}:${LD_LIBRARY_PATH}
    fi
done

######################################################################
# MANPATH
export MANPATH=${HOME}/soft/vim/share/man:${MANPATH}

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
