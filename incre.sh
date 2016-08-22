#! /bin/sh

x=5
#x=$[x+(++x)]
echo "$x"

x=$[ --x ]
echo "$x"

x=$((x++))
echo "$x"

x=$(( x-- ))
echo "$x"




((x=20))
echo "$x"

((x=020))
echo "$x"

((x=0x20))
echo "$x"

((x="2#100000"))
echo "$x"

((x=8#123))
echo "$x"

((x=16#32))
echo "$x"



