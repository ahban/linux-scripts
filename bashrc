# .bashrc

# Uncomment the following line if you don't like systemctl's auto-paging feature:

# User specific aliases and functions
# Ban Zhihua Added the following command.
# If you have any questions, please do not hesitate to ask me at banzhihua@cvte.com

# color prompt
PS1='\[\033[02;32m\]\u@\H:\[\033[02;34m\]\w\$\[\033[00m\] '

######################################################################
# alias 
alias ll='ls -lah --color=auto'
alias 24-3='ssh 24-3'
alias sun='ssh sun'

######################################################################
# PATH
#export PATH=${HOME}/soft/anaconda2/bin:$PATH
#export PATH=${HOME}/soft/python2/bin:${PATH}

#export PATH=${HOME}/soft/python3/bin:${PATH}
export PATH=${HOME}/soft/anaconda3/bin:$PATH

export PATH=${HOME}/soft/ncurses/bin:${PATH}
export PATH=${HOME}/soft/vim/bin:${PATH}

######################################################################
# LD_LIBRARY_PATH
export LD_LIBRARY_PATH=${HOME}/soft/ncurses/lib:${LD_LIBRARY_PATH}

export LD_LIBRARY_PATH=${HOME}/soft/python2/lib:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH=${HOME}/soft/anaconda2/lib:${LD_LIBRARY_PATH}

export LD_LIBRARY_PATH=${HOME}/soft/python3/lib:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH=${HOME}/soft/anaconda3/lib:${LD_LIBRARY_PATH}
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
