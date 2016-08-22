00:03---00：57
1.条件测试

用户可以使用测试语句  来测试指定的条件表达式 是真还是假。

当指定的条件表达式为真时，返回0

当指定的条件表达式为假时，返回非0


条件测试有2种。

1）test命令

    test  expression // expression可以由字符串，整数，文件名以及各种运算符组成
1 -eq 2
'string'

-z 'string'

-e file

2）[ 命令// [是一个2进制程序

 [ expression ]  // expression 和左右方括号之间都必须有一个空格





2.
字符串测试

通常情况下，对字符串的操作主要有 判断字符串变量是否为空，

&& 判断2个字符串是否相等。


在shell中，用户可以使用5种运算符，来对字符串进行操作。

 运算符               说明
string              判断指定的字符串是否为空
string1 = string 2  判断2个字符串string1 和 string 2 是否相等
string1 != string 2 判断2个字符串string1 和 string 2 是否不相等
-n string           判断string是否是 非空串
-z string           判断string是否是 空串

// 字符串为空，和 空串是2回事？？？



3.

a="abc"
test $a
echo $?//0


test -n "$a"
echo $?//0


test -z "$a"
echo $?//a

4
a="hello"
b="world"
[ "$a" = "$b" ]
echo $? //1
test "$a" != "$b"
echo $?// 0


a="Hello world. "
b="Hello world."

[ "$a" = "$b" ]
echo $?// 1



a="Hello world."
b="hello world."

[ "$a" = "$b" ]
echo $?// 1


5.
整数测试

test number1   op number2

or

[ number1   op number2 ]
// number1 , number2 可以是常量或者变量
// op 表示运算符



6.

number1  -eq  number2 // number1   是否等于 number2，如果相等，测试结果为0
number1  -nq  number2 // number1   是否不等于 number2，如果不相等，测试结果为0

number1  -gt  number2 // number1   是否大于 number2，如果大于，测试结果为0

number1  -lt  number2 // number1   是否小于 number2，如果小于，测试结果为0

number1  -ge  number2 // number1   是否大于等于 number2，如果大于等于，测试结果为0
number1  -le  number2 // number1   是否小于等于 number2，如果小于等于，测试结果为0




7.
12 -lt 14
echo $?


12 -gt 14
echo $?


x=12.3
y=12
[ "$x" -gt "$y"]
// 使用针对整数的运算符来比较  非整数会出错


8.
文件测试:

test op file

or

[ op file ]

-a file  //  文件是否存在，if file存在，结果为0
-b file  // 文件是否存在，且为块文件，if exist ,结果为0
-c file  //文件是否存在，且为字符文件，if exist ,结果为0
-d file // 文件是否存在，且为目录文件，if exist ,结果为0

-e file // 同-a
-s file // 文件的长度是否大于0 or 文件为非空文件。if exist ,结果为0
-f file // 文件存在，且为常规文件。if exist ,结果为0
-w file // 文件是否存在且可写。if exist ,结果为0
-L file // 文件是否存在，且为符号链接。if exist ,结果为0
-u file // 文件是否设置suid位。if exist ,结果为0
-r file // 文件是否存在，且可读。if exist ,结果为0
-x file //  文件是否存在，且可执行。if exist ,结果为0


test -a file1
[ -a file3 ]

test -d dir1
test -f file1
test -s file2

test -b file1
test -b /dev/sda

test -c /dev/tty


test -r file
test -w file
test -x file



chmod u+s hello.sh //为hello.sh设置setuid权限。执行该文件的用户就会临时拥有该文件owner的权限
test -u hello.sh


9.
逻辑操作符

 逻辑操作符可以将  多个不同的条件组合起来，从而构成一个复杂的条件表达式。
  
操作符    							说明
!expression   					逻辑非(!)，条件表达式expression的值为假，则该操作符的运算结果为真。
expression1 -a expression2  	逻辑与(and), expression1 和 expression2 都为真，整个表达式才为真
expression1 -o expression2		逻辑非(or)，expression1 和 expression2 有一个为真，整个表达式就为真


a=35
test "$a" -gt 20 -a "$a" -lt 60 // 为真，表示这条命令执行成功，所以返回0
echo $?



[-e file1  -a -w file1]  #判断当前用户是否拥有某个文件的写入权限

10.
条件判断语句：

条件判断语句： 使得程序根据不同的条件   来执行不同的程序分支。



if语句：

if expression  # expression可以是 一个条件表达式，也可以是一个shell命令。
then 
	statement1
	statement2
	statement3
	.....
fi


为了使得代码更加紧凑， 某些情况下，可以将if子句和 then子句写在同一行中，此时需要在expression后面
加一个分号。如下：
if expression;then
	statement1
	statement2
fi

分号的作用：表示if子句已经结束，后面的代码是then子句


11.
通过条件测试  判断文件类型

#! /bin/sh

if [ -f /bin/bash ]
	then echo "/bin/bash is a file"
fi

12.
通过条件测试  判断文件是否创建成功

#! /bin/sh
echo "hello world" > ./msg.log
if [ -f ./msg.log ]; then
  echo "file has been created.";
fi


使用空命令作为判断条件

#! /bin/sh
if :; then
	echo "always true";
fi



13.
使用&&操作符 代替if语句。

#! /bin/sh

test "$(whoami)" != "root" && (echo you are using a non-privileged account; exit 1 )



14.

if else 语句的基本语法：

if expression
then    # expression 为真
	statement1
	statement2
	....
else  # expression 为假
	statement3
	statement4
	...
fi  #fi 关键字结束 整个if代码块


#! /bin/sh

echo "Please enter a number:"
read num
if [ "$num" -gt 10 ];then
	echo "The number is greater than 10."
else
	echo "The number is equal to or less than 10."
fi


15.

使用百分制，输出分数等级。
#! /bin/sh


echo "Please input a score:"
read score
if [ -z "$score" ];then # -z "$score" 判断$score是否是空串
	echo "You enter nothing.Please input a score:"
	read score
else
	if [ "$score" -lt 0 -o "$score" -gt 100 ];then
	echo "The score should be between 0 and 100.Please enter again."
	read score
	else
		if [ "$score" -ge 90 ];then
			echo "The grade is A."
		else
			if [ "$score" -ge 80 ];then
			  echo "The grade is B."
			else
			   if [ "$score" -ge 70 ];then
			     echo "The grade is C."
			   else
				 if [ "$score" -ge 60 ];then
			     echo "The grade is D."
				else
				 echo "The grade is E."
                 fi
			  fi
			fi
		fi
	fi
fi



16.
使用if elif语句进行多条件判断

if expression1    #
then
	statement1
	statement2
	...
elif expression2  # 
then 
	statement3
	statement4
	...
elif expression3  #
then
	statement5
	statement6
	...
else
	statementn   #所有条件表达式的值都为假，
fi  #结束标志


使用if elif改写上面的程序
#! /bin/sh
echo "Please enter a score."
read score

if [ -z "$score" ];then
	echo "You enter nothing. Please enter a score."
	read score
else
	if [ "$score" -gt 100 -o "$score" -lt 0 ];then
		echo "The score should be between 0 and 100.Please enter again."
	else
		if [ "$score" -ge 90 ];then
			echo "The grade is A."
		elif [ "$score" -ge 80 ];then
			echo "The grade is B."
		elif [ "$score" -ge 70 ];then
			echo "The grade is C."
		elif [ "$score" -ge 60 ];then
			echo "The grade is D."
		else
			echo "The grade is E."
		fi
	fi
fi


17.
exit 语句退出程序：

exit 语句的基本作用是  终止shell程序的执行。

exit 语句还 可以带一个可选的参数，用来指定程序退出时的状态码。

exit 的基本语法：
exit status   #status 表示退出状态。 该参数是一个整数值。取值范围：0~255.

与其他的shell命令一样。shell程序的退出状态也存在系统变量$?中，
用户 可以通过该变量 取得shell程序返回给 父进程的退出 状态码。

#! /bin/sh

echo hello world!
echo $?
aaa
echo $?
exit 120


18.
多条件判断语句case：

#  variable 是一个变量
# case语句会将 该变量的值 与 value1~valuen中的每个值
# 进行比较，如果与某个value的值相等，则执行该value所
# 对应的一组语句。当遇到";;"符号时，就退出case语句，
# 执行esac语句后面的语句。如果没有任何一个值与
# variable的值相匹配。则执行×后面的一组语句。

case variable in   
value1) 
	statement1
	statement2
.....
	statementn;;
value2)
	statement1
	statement2
.....
	statementn;;
value3)
	statement1
	statement2
.....
	statementn;;
...
valuen)
	statement1
	statement2
.....
	statementn;;
*) #default
	statement1
	statement2
.....
	statementn;;
esac


19.
利用case语句处理选项参数

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


20.
算术运算符：

+ 和   1+5
- 差   1-4
* 乘   1 * 4
/ 商   28/5
% 模   23%4
** 幂  3**3==27

21.
在Linux Shell中，用户可以通过4种方式，来执行算术运算。
这4种方式如下：
1)使用expr外部程序。
expr 是一个shell命令，可以计算某个表达式的值，语法如下：
expr expression

#! /bin/sh
result=`expr 2 - 100`
echo "$result"

result=`expr 2 \* 5` #计算2*5
echo "$result"

result=`expr 24 / 3 `
echo "$result"


result=`expr \( 2 - 6 \) \* 12`
echo "$result"

result=`expr 2 + 100`
echo "$result"



result=`expr 2 - 4 * 9`
echo "$result" #错误的语法

result=`expr 2 - ( 100 - 7) `
echo "$result" #错误的语法

2）使用$(( ... ))
使用这种形式来进行算术运算写法比较自由。不需要对运算符和括号进行转义处理。
可以采用松散或者紧凑的格式来书写表达式。

#! /bin/sh

result=$((3+6)) #紧凑格式
echo "$result"


result=$(( 3 + 6 )) #松散格式
echo "$result"


result=$(( 3 * 6 )) #
echo "$result"


result=$(( 3 / 6 )) #
echo "$result"

result=$(( 3 % 6 )) #
echo "$result"


result=$(( (3-2) * 6 )) #
echo "$result"

 3）$[...]  使用方括号进行算术运算

#! /bin/sh

result=$[4+5]
echo "$result"

result=$[(4+5) * 1]
echo "$result"

result=$[ 2 ** 3 ]
echo "$result"

4) 使用let命令   进行算术运算
 使用let命令可以执行一个或 多个算术表达式，其中的变量名不需要使用$符。
如果表达式中含有空格 或者 其他特殊字符，则必须将其引用起来。
#! /bin/sh
n=10
let n=n+1
echo "$n"
let n=n*10
echo "$n"
let n=n**2
echo "$n"

22.
复合算术运算符
+=  3 += 5
-= 
*=
/= 
%=  22%=3 ==1




22.
位运算符：
位运算通常出现在整数间，它针对的不是整个整数，而是其二进制表示形式中的
某个或者某些位(bit).
e.g.: 2 << 1 #10 左移1位,得到100，即4

<<    左移   4<<2
>>    右移    8>>2

&   按位与    8 & 4
|   按位或    8|4
～  按位非    ~8
^   按位异或  10 ^ 6


复合位运算符：
<<=  x <<= 3
>>=  x >>= 4
&=   x &= 8
|=   x |= 7
^=   x ^= 9



23.
自增/自减运算符

前置自增 ++variable
后置自增 variable++
前置自减 --variable
后置自减 variable--



24.数字常量的进制
在shell中，用户可以使用2种语法来表示不同的进制。
1)增加前缀。以0开头的数字表示八进制。
0x 开头的数字表示十六进制。

2)使用“#”，2#100，表示2进制
8#42  表示八进制





		

































