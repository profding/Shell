1.在Linux上搭建shell编程环境

由于Linux本身都会默认安装shell脚本的运行环境。所以通常情况下，
并不需要额外的安装什么软件。但是，在同一台Linux上面会同时安装多个shell,
并且这些shell的语法会有所不同，所以，用户在编写和执行shell脚本的时候一定要
弄清楚当前使用的shell是哪种shell.用户可以使用 系统变量$SHELL 来获取当前系统默认的shell。

$SHELL or "$SHELL"


2.
FreeBSD // 自由BSD
默认情况下，FreeBSD使用的shell是csh.


3.
图形化编辑器：ShellEd.UltraEdit,Notepad++,vi
vi:visual interface

4.
在运行shell程序的时候，除了脚本本身之外，还有许多因素影响到shell的执行结果。
主要有shell本身的环境以及命令的别名等。


5.
Bourne Shell(sh)的配置文件主要有2个，分别为每个用户主目录
中的.profile文件，以及/etc/profile文件。

在前面的2个文件中，后者是所有的用户共同使用的文件。
每个用户在登录shell之后，会首先读取和执行/etc/profile文件中的脚本，
然后再读取和执行各自主目录中的.profile文件。
因此，用户可以将所有用户都需要执行的脚本放在/etc/profile文件中。
---->从这里我们可以推论：vi的配置文件也是这么干的，很多软件应该也是这样的，
这么好的机制没有理由仅仅只是用在shell这一个地方。


6.
Bourne-Again Shell(bash)配置文件主要有5个，其中有4个
位于用户主目录中，分别是.bash_profile,.bashrc,.bash_logout和
.bash_history,有1个位于/etc/bashrc

.bash_profile:该文件用来保存每个用户自己使用的shell信息。当用户登录时，
这个文件会被读取并执行。而且只执行一次。默认情况下，
.bash_profile文件常常用来设置  环境变量，执行用户的.bashrc文件。

.bashrc: 包含专属于某个用户的bash的相关信息。当
用户登录以及每次打开新的bash时，该文件将被读取并执行。


.bash_logout:在当前用户每次退出shell时执行。如果没有特别要求，
该文件内容通常为空。

/etc/bashrc 和 sh中的/etc/profile文件非常相似，
它是所有使用bash的用户共同使用的文件。
当任何用户在登录bash后，都会执行该文件中的代码。


7.
命令别名：
作用：简化命令的输入。
对于一个包含许多选项和参数的命令，可以设置一个别名，
直接用别名调用就行了。

alias  command_alias = command



22：55---00:24 SHELL
00:27 --- 1:06 Linux C 
8.
在shell中，变量名可以由字母、数字、和下划线组成，
只能以字母和下划线开头。


shell是一种动态类型语言，变量的数据类型不需要显示的声明，
变量的数据类型 会 根据不同的操作有所变化。

也就是说，shell中的不区分数据类型 ，统一按字符串存储。

但可以根据变量的上下文环境，允许程序执行一些不同的操作，

比如字符串的比较  和 整数的加减等等。


9.

#! /bin/bash

x=123

let "x += 1"#变量x+1

echo "x = $x" #输出变量x的值

echo #输出空行


y=${x/1/abc}#替换x的1为abc,并且将值赋给y

declare -i y


z=abc22 #将字符串赋给z


m=${z/abc/11}#替换z的abc为11,并且将值赋给m

n="" #将空串赋给变量n


echo "p = $p"#输出空变量p的值

10.
在shell中，通常情况下，
用户可以直接使用变量，而不需要先进行定义。
当用户第一次使用某个变量名时，实际上就同时定义了这个
变量，在变量的作用域内，用户都可以使用这个变量。


11.
通过declare 命令声明变量

declare attribute variable


-p: 显示所有变量的值   declare -p | more

-i: 将变量定义为整数，在之后，就可以直接对表达式
求值，结果只能是整数。
如果求值失败 或者  不是整数，就设置为0


-r: 将变量设置为只读变量。只读变量不允许修改，
也不允许删除。


-a: 变量声明为数组变量。但没有必要。
所有变量都不必显式定义就可以用作数组。
某种意义上，所有变量都是数组，而且赋值给
没有下标的变量与赋值给下标为0的数组元素相同。



-f: 显示所有自定义函数，包括名称和函数体。


-x: 将变量设置成环境变量，这样在随后的脚本和程序中可以使用。


12.

x=6/3
echo "$x"
declare -i x
echo "$x"
x=hello
declare +i x  #取消变量x的整数属性。
x=6/3
x=$[6/3]

x=$((6/3))

declare -r x
x=5 #尝试为只读变量赋值



13.
'普通字符'
反引号 ` `
" ": $, \, ', " 这4个字符在“”内任然是特殊字符，(????)
并保留其特殊功能，其余字符仍是普通字符。

由反引号 ` `括起来的字串被shell解释为命令，
在执行时，shell首先执行该命令。并以他的
标准输出结果取代整个反引号（包括2个反引号 ）部分。


echo "current dir is `pwd` "

14.
shell中的变量也分为全局变量和局部变量。

全局变量：可以在脚本中定义，也可以在函数中定义。

在脚本中定义的变量都是全局变量，它的作用域从
被定义的地方开始，一直到shell脚本结束，或者 被
显式的删除。


15.

#! /bin/bash

func()
{
  echo "$v1"
v1 = 200

}

v1=100
func #调用函数
echo "$v1"


16.
在函数中定义全局变量

func()
{
  v2=20
}
func
echo "$v2"


17.

局部变量:通常仅限于某个程序段访问，比如
函数内部。

在函数内，通过local 关键字 定义局部变量。
函数的参数也是局部变量。


func()
{
    local v2 = 200
}

func

echo "$v2"



18.

func()
{
    echo "global variable v1 is $v1"
    local v1=2
    echo "local variable v1 is $v1"
}

v1=1
func
echo "global variable v1 is $v1"



19.
shell中的系统变量 主要用在对

参数判断   & 命令返回值  判断时使用

包括 ：
脚本 & 函数 的参数；

脚本 & 函数 的返回值；

$n   n is integer ,start  from 1, $1,$2...
$#   命令行参数个数
$0   当前shell脚本的名字
$?   前一个命令or函数 的返回状态码
$*   "参数1 参数2...."的形式将所有参数通过一个字符串返回
$@    以“参数1”“参数2”...的形式返回每个参数
$$    返回本程序的pid

20.
shell的环境变量是所有的shell程序都
可以使用的变量。shell程序在运行时，都会接收一组变量
，这组变量就是环境变量。

环境变量会影响到所有的脚本的执行结果。


PATH 命令搜索路径，以:分隔
HOME 用户主目录的路径名，是cd命令的默认参数
COLUMNS  定义了命令编辑模式下可使用命令行的长度
HISTFILE 命令历史文件
HISTSIZE 命令历史文件最多可以包含的命令条数
HISTFILESIZE 命令历史文件中包含的最大行数
IFS  定义shell使用的分隔符
LOGNAME  当前的登录名
SHELL  shell的全路径名
TERM  终端类型
TMOUT  shell自动退出的时间，单位为秒，如果设为0，则禁止shell自动退出。
PWD

用户可以使用set命令列出当前系统的 环境变量  set | more

21.
shell中变量的赋值：
variable_name=value


$变量 ： 获取变量的值。



22.
shell变量不需要时，可以清除。
当变量被清除时，其所代表的值也会消失。
清除变量：
unset variable_name;



23.
变量的引用和替换是shell对于变量功能的扩展。


引用：将字符串用 引用符号 包括起来，防止
其中的特殊字符被shell解释为其他含义。

特殊字符：除了字面意思之外，还可以解释为其他意思的字符。

比如："$"既是美元符号，也是获取某个变量的值，即变量替换

ls ex*



24.

'字符串' ：全引用


命令替换：在shell程序中，将某个shell命令的执行
结果，赋给某个变量。

在bash 中，有2种语法可以进行命令替换
`shell_command`
<===>$(shell_command)


echo \$SHELL # $SHELL








