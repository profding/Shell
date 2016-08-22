#! /bin/bash

result=$[ 2 << 1 ]  #4,左移
echo "$result"
result=$[ 2 >> 1 ] #1，右移
echo "$result"

result=$[ 8 & 4 ] #0
echo "$result"


result=$[ 8 | 4 ] #12
echo "$result"



result=$[ ~8 ] #-9
echo "$result"


result=$[ 10 ^ 6 ] #12
echo "$result"





exit 0

