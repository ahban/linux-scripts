#!/bin/bash
###############################################################################
# Author  : Ban Zhihua
# Contact : sawpara@126.com
# Time    : Fri 09 Nov 2018 10:12:39 AM CST
###############################################################################

printf_repeat(){
    local char=$1
    local num=$2
    local str=
    printf -v str "%-${num}s" " "
    printf "${str// /$char}"
}

new_cpp_file(){
    if [[ ! -e $1 ]] ; then
        local file_name=$1
        iso_filename=$(echo $file_name | awk -F/ '{printf "%s", $NF}')
        printf "/*" > $file_name
        printf_repeat "*" 77 >> $file_name
        printf "\n" >> $file_name
        printf "  > file name    : $iso_filename\n" >> $file_name
        printf "  > author       : Ban Zhihua\n" >> $file_name
        printf "  > contact      : sawpara@126.com\n" >> $file_name
        printf "  > created time : $(date)\n" >> $file_name 
        printf_repeat "*" 78 >> $file_name 
        printf "/\n" >> $file_name 
        printf "#include <iostream>\n" >> $file_name
        printf "using namespace std;\n" >> $file_name
        printf "int main(int argc, char **argv){\n" >> $file_name
        printf "    return 0;\n" >> $file_name
        echo "}" >> $file_name 
    fi
}

new_h_file(){
    if [[ ! -e $1 ]]; then 
        local file_name=$1
        local hmac=
        # comments
        printf "/*" > $file_name
        printf_repeat "*" 77 >> $file_name
        printf "\n" >> $file_name
        printf "  > file name    : $iso_filename\n" >> $file_name
        printf "  > author       : Ban Zhihua\n" >> $file_name
        printf "  > contact      : sawpara@126.com\n" >> $file_name
        printf "  > created time : $(date)\n" >> $file_name 
        printf_repeat "*" 78 >> $file_name 
        printf "/\n" >> $file_name 
        # ifdef and endif
        hmac=$(echo $file_name | sed "s/-/_/g" | awk '{printf "%s", toupper($0)}')
        hmac=$(echo $hmac | sed 's/^/__/; s/$/__/; s/\./_/g')
        printf "#ifndef ${hmac}\n" >> $file_name
        printf "#define ${hmac} 1\n" >> $file_name
        printf "\n" >> $file_name 
        printf "#endif // end ${hmac}" >> $file_name 
    fi
}

new_tex_file(){
    if [[ ! -e $1 ]]; then 
        local file_name=$1
        iso_filename=$(echo $file_name | awk -F/ '{printf "%s", $NF}')
        printf_repeat "\%" 79 > $file_name
        printf "\n" >> $file_name
        printf "%  file name    : $iso_filename\n" >> $file_name
        printf "%  author       : Ban Zhihua\n" >> $file_name
        printf "%  contact      : sawpara@126.com\n" >> $file_name
        printf "%  created time : $(date)\n" >> $file_name 
        printf_repeat "%" 79 >> $file_name 
        printf "/\n" >> $file_name 
    fi
}
