#!  /bin/bash

# 获取当前目录下所有 的目录，不包括. 和 .. ,
# 并进入子目录下，新建一个note.txt,然后返回。
for dir in $(ls ./)
do
	[ -d "$dir" ] && cd "$dir" && touch note.txt && cd ../
done
