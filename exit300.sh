#!/bin/bash

echo  Hello
code=$[256 + 44]  #300,猜测，shell可能对返回值进行了 %256运算。
exit $code  #max 255
