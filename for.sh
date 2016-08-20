#! /bin/sh

for filename in `ls .`
do
if echo "$filename" | grep "sh"
then
echo "$filename"
fi
done
