#!/bin/bash
###############################################################################
# file name    : install.sh
# authors      : Ban Zhihua(2018)
# contact      : sawpara@126.com
# created time : Thu 20 Dec 2018 08:56:11 AM CST
###############################################################################

if [[ ${PWD} != "${HOME}/.scripts" ]]; then
    echo "Please copy contents of current directory into ~/.scripts"
    exit 0
fi

if [[ -e ~/.vimrc ]]; then
    echo "backuping your ~/.vimrc to ~/.vimrc.script.back"
    mv ~/.vimrc ~/.vimrc.script.back
fi

if [[ -e ~/.tmux.conf ]]; then
    echo "backuping your ~/.tmux.conf to ~/.tmux.conf.script.back"
    mv ~/.tmux.conf ~/.tmux.conf.script.back
fi

# echo "Installing bashrc"

echo ''                                           >> ~/.bashrc
echo '# the following line must be the last line' >> ~/.bashrc 
echo 'if [ -f ${HOME}/.scripts/bashrc ]; then'    >> ~/.bashrc
echo '    source ${HOME}/.scripts/bashrc'         >> ~/.bashrc
echo 'fi'                                         >> ~/.bashrc

echo 
echo "Installing vimrc and tmux.conf"
ln -s ${PWD}/vimrc ${HOME}/.vimrc
ln -s ${PWD}/tmux.conf ${HOME}/.tmux.conf
ln -s ${PWD}/gitconfig ${HOME}/.gitconfig


# https://www.math.ias.edu/computing/faq/local-latex-style-files
echo "Installing latex stuff"
if [[ ! -d ${HOME}/texmf/tex/latex ]]; then
    mkdir -p ${HOME}/texmf/tex/latex
fi
for f in `ls ./latex` 
do
    echo "Installing $f"
    ln -s ~/.scripts/latex/$f ${HOME}/texmf/tex/latex/$f
done
echo 'Use "$ kpsewhich [package name].sty" to show the sty file'
