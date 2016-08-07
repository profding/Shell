#!/bin/sh

myfile="~/Desktop/file.list"

if [ -f "$myfile" ]; then
    echo  bye >  jjj
    exit 0
else
    cd ..
    ls > ~/Desktop/file.list
fi
