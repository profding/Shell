#!/bin/sh

myfile=~/Desktop/file.list # 加双引号是错误的 ！"~/Desktop/file.list"

cat $myfile
if [ -f "$myfile" ]; then
    echo  bye >  jjj
    exit 0
else
    cd ..
    ls > ~/Desktop/file.list
fi
