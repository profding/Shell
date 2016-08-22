
#! /bin/sh

echo "Hit a key,then hit return."
read keypress
case "$keypress" in
[[:lower:]]) #小写字母
	echo "Lowercase letter.";;
[[:upper:]]) #大写字母
	echo "Uppercase letter.";;
[0-9]) #单个数字
	echo "Digit.";;
*) #其他字符
	echo "other letter.";;
esac
