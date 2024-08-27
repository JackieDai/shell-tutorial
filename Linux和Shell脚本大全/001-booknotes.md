# 初始Linux

Linux可划分为以下四部分

- Linux内核
- GNU工具
- 图形化桌面环境
- 应用软件

![](https://raw.githubusercontent.com/JackieDai/blogAssets/main/202408220816484.png)

## Linux 内核(Kernel)

Linux系统的核心是内核。内核控制着计算机系统上的所有硬件和软件，在必要时分配硬件， 并根据需要执行软件。

内核主要负责

- 系统内存管理
- 软件程序管理
- 硬件设备管理
- 文件系统管理

## GNU 工具

GNU组织(GNU是GNU’s Not Unix的缩写)

> Personal Tips:
>
> GNU 主要是系统用来操作文件的标准，用来补充Linux的系统工具

---

# 环境变量(environment variable)

**环境变量用来存储Shell会话或者工作环境的信息**

- 全局环境变量
- 局部环境变量

## 全局环境变量

全局环境变量对于shell会话和所有生成的子shell都是可见的。局部变量则只对创建它们的 shell可见

用来查看全局变量的指令(2选1，两者都可以)

- `env`
- `printenv`

printenv + env_variable 可以查看个别 环境变量的值，而`env`却不可以

```shell
% printenv HOME
/Users/lingxiao
% 
```

或者 `echo` 也可以，但是必须加上`$`

```
% echo $HOME
/Users/lingxiao
% 
```

## 创建全局环境变量

使用 **`export`** 关键字 把局部环境变量转成全局环境变量

```shell
% lcoalVar="LocalVariable"
% echo $lcoalVar
LocalVariable
% zsh #启动一个子shell
This is .zshrc shell script ... 
% echo $lcoalVar # 可以看到子Shell 无法访问 局部变量

% globalVar="gloableVar"
% export globalVar #把局部变量转成全局变量
% zsh #启动一个子shell
This is .zshrc shell script ... 
% echo $globalVar #可以看到在子Shell 中能够访问 全局环境变量 
gloableVar 
```

通过上述案例，可以看到，通过`export`把局部变量转成全局变量，**但这种改变仅仅对子shell 有效**，<u>子Shell 也无法使用`export`命令去改变父shell中的全局环境变量的值</u>， 接着上述案例来呈现这一特点

```sh
% echo $globalVar
gloableVar
% zsh #启动一个子shell
This is .zshrc shell script ... 
% globalVar="sub change parent var"
% echo $globalVar 
sub change parent var
% export globalVar
% echo $globalVar 
sub change parent var
% exit #退出这个子shell
% echo $globalVar  #再一次输出的值仍是之前gloabl的环境变量     
gloableVar
% 
```

## 删除环境变量

继续上面的例子分析,使用`unset`来删除已经存在的环境变量

```shell
% echo $globalVar 
sub change parent var
% unset globalVar  # 删除环境变量
% echo $globalVar

% 
```

> 在涉及环境变量名时，什么时候该使用$，什么时候不该使用$，实在让人摸不着头脑。 记住一点就行了**:如果要用到变量，<u>使用\$</u>;如果要操作变量，<u>不使用\$</u>**。这条规则的一 个例外就是使用printenv显示某个变量的值。

**注意**

1. 如果在子Shell中删除一个全局环境变量，则只对子进程有效

## 默认的环境变量

略

## 设置PATH环境变量

PATH环境变量定义了用于执行命令和程序查找的目录

> PATH 是系统默认的全局环境变量，其定义了可执行文件所在的目录，当我们在终端输入一个指令的时候，该指令会去PATH环境变量定义的程序目录中查找，如果找到则执行，否则报错。

```
 % echo $PATH
/Users/local/.pyenv/shims:/Users/local/.pyenv/bin:/Users/local/miniconda3/bin:/Users/local/.nvm/versions/node/v20.10.0/bin:/usr/local/opt/ruby@3.1/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/local/lua-5.3.0:/Library/Apple/usr/bin:/Users/local/.gem/ruby/3.1.0/bin
 % 
```

**PATH中的目录使用冒号(:)分隔;**

当应用程序的可执行文件目录不在**PATH**环境变量包含的目录中，我们需要把其添加到`PATH`环境变量中

```
PATH=$PATH:/Your/Program/Path
```

## Shell的启动流程

1. etc/profile

   > 系统自动启动时候就会执行

2. $HOME/.zshrc 

   > 这里至于应该执行哪一个脚本，取决于你的Shell类型
   >
   > 这这个文件中，我们可以把自己需要配置的全局环境变量写在这个文件里，用来进行持久化的操作

---

# Linux 文件权限

先来看代码

```shell
% ls -l
total 8064  ## 表示目录中的总块数
-rwxr-xr-x@ 1 lingxiao  staff  4115408 Aug 19 15:40 OSToDiags
-rw-r--r--@ 1 lingxiao  staff     3384 Aug 19 14:44 OSToDiags.py
-rw-r--r--  1 lingxiao  staff      718 Aug 19 15:40 OSToDiags.spec
drwxr-xr-x  3 lingxiao  staff       96 Aug 19 15:40 build
drwxr-xr-x  3 lingxiao  staff       96 Aug 22 08:54 dist
-rw-r--r--@ 1 lingxiao  staff     2796 Aug 20 08:58 serialTool.py
% ls -lF
```

第一行显示了在目录中包含的总块数

![](https://raw.githubusercontent.com/JackieDai/blogAssets/main/202408230926914.png)

> 第一个字符
>
> - `-`代表文件
> - `d`代表目录
> - `l`代表链接
> - 其他略...

![](https://raw.githubusercontent.com/JackieDai/blogAssets/main/202408230930410.png)

### Symbolic Mode (符号模式)

改变文件权限，我们以上述 `OSToDiags.spec ` 为例，看到User有读写权限，没有执行权限，Group和Others只读

```shell
% chmod u+x OSToDiags.spec
% ls -l 
-rwxr--r--  1 lingxiao  staff      718 Aug 19 15:40 OSToDiags.spec
% 
```

观察上面，可以看到 `u`增加了`x`的权限

> - `u`表示登录的用户
> - `g`表示组
> - `o`表示其他用户
>
> ---
>
> 如果给所有用户都添加某一权限用`a`表示
>
> ```shell
> % chmod a+x OSToDiags.spec
> % ls -l OSToDiags.spec    
> -rwxr-xr-x  1 lingxiao  staff  718 Aug 19 15:40 OSToDiags.spec
>  % 
> ```
>
> ---
>
> 更改文件的权限 语法 是
> `chmod 用户[运算符]权限 文件`
>
> 运算符有三种，权限也可以写在一起
>
> ![image-20240823104429140](/Users/lingxiao/Library/Application Support/typora-user-images/image-20240823104429140.png)
>
> ```shell
> % ls -l OSToDiags.spec
> -rwxr-xr-x  1 lingxiao  staff  718 Aug 19 15:40 OSToDiags.spec
> % chmod o+xw OSToDiags.spec 
> % ls -l OSToDiags.spec     
> -rwxr-xrwx  1 lingxiao  staff  718 Aug 19 15:40 OSToDiags.spec
> % chmod u-x OSToDiags.spec
> % ls -l OSToDiags.spec    
> -rw-r-xrwx  1 lingxiao  staff  718 Aug 19 15:40 OSToDiags.spec
> % chmod o=rx OSToDiags.spec
> % ls -l OSToDiags.spec     
> -rw-r-xr-x  1 lingxiao  staff  718 Aug 19 15:40 OSToDiags.spec
> % chmod a=r OSToDiags.spec 
> % ls -l OSToDiags.spec    
> -r--r--r--  1 lingxiao  staff  718 Aug 19 15:40 OSToDiags.spec
> % 
> ```

## Absolute Permissions(绝对权限)

```shell
 % ls -l DiagsToOS.spec
-rw-r--r--  1 lingxiao  staff  718 Aug 19 08:12 DiagsToOS.spec
 % chmod 755 DiagsToOS.spec
 % ls -l DiagsToOS.spec    
-rwxr-xr-x  1 lingxiao  staff  718 Aug 19 08:12 DiagsToOS.spec
 % chmod 743 DiagsToOS.spec
 % ls -l DiagsToOS.spec    
-rwxr---wx  1 lingxiao  staff  718 Aug 19 08:12 DiagsToOS.spec
 % chmod 043 DiagsToOS.spec 
 % ls -l DiagsToOS.spec    
----r---wx  1 lingxiao  staff  718 Aug 19 08:12 DiagsToOS.spec
 % 
```

> 每一个数字表示相对应的权限
>
> 每一个数字的的位置代表对应的位置的用户

# shell

![](https://raw.githubusercontent.com/JackieDai/blogAssets/main/unix_architecture.jpg)

当我们启动`Terminal`时候，在第一行最后会出现`ttys0000`

```shell
Last login: Thu Aug 22 08:30:58 on ttys000
This is .zshrc shell script ... 
% 
```

>  tty代表电传打字机(teletypewriter),用于发送消息的机器

## 常用命令

### `man` + cmd ： 查看指令的说明

用来访问存储在Linux系统上的手册页面。在想要查找的工具的名称前面输入man命 令，就可以找到那个工具相应的手册条目

```
man ls
---
LS(1)                        General Commands Manual                       LS(1)

NAME
     ls – list directory contents
```

使用`q` 退出

### `cd` ： 切换目录

这里是一些高级的用法，常规的用法不在此处介绍

- 直接 使用 `cd` 或者 `cd ~` 会回到 HOME 目录下
- 使用 `cd -` 会返回 back to 上一个目录

> 单点符(`.`)，表示当前目录;
>
> 双点符(`..`)，表示当前目录的父目录
>
> ```chell
> lingxiao@lingxiaodeMacBook-Air Desktop % cd .
> lingxiao@lingxiaodeMacBook-Air Desktop % cd ..
> % 
> ```

### `pwd` : 查看当前所在的绝对路径

> - 绝对路径 **一定以**`/`开头
> - 相对路径 **一定不以**`/`开都

### `ls` 文件和目录列表

基础用法:(略)

> 可以使用 man ls 查看更过用法

#### `ls -F`

-F参数在目录名后加了正斜线(`/`); 在可执行文件后面加了`*`

```
% ls -F
OSToDiags*	OSToDiags.spec	dist/
OSToDiags.py	build/		serialTool.py
% 
```

#### `ls -F -R` 或者  `ls -FR`

> 递归查看

#### `ls -l` 显示长列表

```
total 8064
-rwxr-xr-x@ 1 lingxiao  staff  4115408 Aug 19 15:40 OSToDiags
-rw-r--r--@ 1 lingxiao  staff     3384 Aug 19 14:44 OSToDiags.py
-rw-r--r--  1 lingxiao  staff      718 Aug 19 15:40 OSToDiags.spec
drwxr-xr-x  3 lingxiao  staff       96 Aug 19 15:40 build
drwxr-xr-x  3 lingxiao  staff       96 Aug 22 08:54 dist
-rw-r--r--@ 1 lingxiao  staff     2796 Aug 20 08:58 serialTool.py
```

#### `touch file` - 创建文件

#### `cp source destination` - 复制文件

#### `mv a b` - 重命名文件或者移动文件

#### `rm -i file` - 删除文件 注意一定要加上 “i”选项

#### `mkdir dir` - 创建目录

> mkdir -p parentPath/SubPath

#### `rmdir dir` - 删除目录

默认情况下，rmdir命令只删除空目录。因为我们在New_Dir目录下创建了一个文件my_file， 所以rmdir命令拒绝删除目录。

#### `file + finlName` - 查看文件类型

```
% file dist 
dist: directory
% file serialTool.py 
serialTool.py: Python script text executable, Unicode text, UTF-8 text
% file OSToDiags.spec 
OSToDiags.spec: ASCII text
```

#### `cat + filename` 查看文件

#### `ps` 查看进程

默认情况下，ps命令只会显示运行在当前控制台下的属于当前用户的进程。

```shell
% ps
  PID TTY           TIME CMD
 6218 ttys000    0:01.49 -zsh
% 
```

可以通过 `man ps` 查看更多用法

#### `kill + PID`结束对应`PID`的进程

#### `killall+ProcessName` 结束ProcessName的进程(支持通配符模式)

#### `alias` 查看所有设置的Shell别名

```
% alias    
py=python3
python=python3
run-help=man
which-command=whence
ykb=jekyll
% 
```

## 使用多个命令

Shell中可以将多个命令放在一起;

```shell
 % date;who;cal
Mon Aug 26 08:31:51 CST 2024
lingxiao console  Aug 24 09:19 
lingxiao ttys000  Aug 26 08:31 
    August 2024       
Su Mo Tu We Th Fr Sa  
             1  2  3  
 4  5  6  7  8  9 10  
11 12 13 14 15 16 17  
18 19 20 21 22 23 24  
25 26 27 28 29 30 31  
                      
 % 
```

## 脚本编程基础

```
#!/bin/bash
```

在通常的shell脚本中，井号(#)用作注释行。shell并不会处理shell脚本中的注释行。然而， shell脚本文件的第一行是个例外，#后面的惊叹号会告诉shell用哪个shell来运行脚本.

>  Shell 在使用变量时候的注意点 
>
> 当 **\$var** 不明确的时候，可以使用**\${var}**来使用变量
>
> ```shell
> % var=Hello_
> % echo "$varWorld" #此处会把`varWorld`当成变量，没法区分`var`变量
> 
> % echo "${var}Wrold"  #此处使用 ${var}来区分出变量
> Hello_Wrold
> ~ % 
> 
> ```

## 命令替换

意思是从命令输出中提取信息,并将其赋给变量。

命令替换的两种方式

- 反引号字符(`)
- $()格式

```shell
#!/bin/sh

testStr=`date`
echo "CurrentDate is $testStr"

testStr2=$(date)
echo "date--- is $testStr2"
```

输出如下:

> CurrentDate is 2024年 8月23日 星期五 13时45分14秒 CST
> date--- is 2024年 8月23日 星期五 13时45分14秒 CST

## 运算

shell 的运算通常有两种方式

- expr

  > 使用教程:略

- 使用方括号

  > ```shell
  > var=$[1 + 5]
  > echo $var ## 6
  > ```
  >
  > 注意在赋值的时候,需要再方括号前添加`$`符号

## 退出脚本

shell中运行的每个命令都使用退出状态码(exit status)告诉shell它已经运行完毕。退出状态 码是一个0~255的整数值，在命令结束运行时由命令传给shell。可以捕获这个值并在脚本中使用。

通过 `$?` 来获取状态码

- 0 表示成功
- 其他正直表示错误

当然，我们也可以自己指定退出的状态码 通过 `exit code`,请注意 这个code 的最大值不超过255.

```shell
#!/bin/sh

function test1() {
    echo $(date)
}

test1
echo $? ## 0

function test2() {
    echo $(who)
    exit 5 ## 这里就已经退出了 当前Shell 进程,并且这个状态码5会在上一次Shell的进程中获取到
}
test2

# 注意一下的代码不会被执行
echo $?

# 这里的也不会被执行
echo $(cal)
exit 8
echo "--------"
echo $?
```

通过终端调用上述脚本，我们能够看到

```shell
% ./004-退出状态码.sh
2024年 8月23日 星期五 15时17分54秒 CST
0
lingxiao console Aug 21 09:15 lingxiao ttys000 Aug 23 15:07
% echo $?            
5
% 
```

## Shell 中的 `决策树`,(making decision)

最简单的if

```shell
if pwd; then
    echo "It works ('if' and 'then' locate at some line, must using "\;" to seperation)"
fi

if pwd
then
    echo "It works"
fi
```

> 当 if 和 then 在一行的时候，需要再 if 条件语句 添加`;`； 如果不在一行就不用
>
> `fi` ： 是 finish 的缩写，表示 `if ` 语句结束了

值得注意的是，当if 后面的语句是 `命令的时候`那么，其执行完成之后的退出状态为`0`(即`$? == 0`) 时，表示成功，会继续执行 `then`部分的语句。

多个条件判断的时候，也可以使用逻辑组合

- `&&`  逻辑与
- `||`  逻辑或

**if - elif - else**

> `if` 和 `elif` 后面 必须跟 `then`, 如果在同一行，则需要`";"`

```shell
test03() { 
    if (( $1 == 1 )); then
        echo "fist"
    elif (( $1 == 2 )); then
        echo "second"
    else
        echo "no body using"
    fi
}
test03 1
test03 2
test03 3

## fist
## second
## no body using
```

### 测试判断条件 -- test 命令

> if 条件中的语句退出并返回状态码 为 0 的时候，才会执行 其then之后的逻辑;
>
> test命令提供了在if-then语句中测试不同条件的途径。如果test命令中列出的条件成立，test命令就会退出并返回退出状态码0。如果条件不成立，test命令就会退出并返回非零的退出状态码，这使得 if-then语句不会再被执行。
>
> !!! 如果不写test命令的condition部分，它会以非零的退出状态码退出，并执行else语句块

```shell
test04() {
    var="FUll"
    if test $var; then
        echo "返回状态码True"
    else
        echo "返回状态码False"
    fi
}
test04 # 返回状态码True
```

> test命令可以判断三类条件: 
>
> - 数值比较
> - 字符串比较
> - 文件比较

### 测试判断条件 -- `[  ]`

> !!! 第一个方括号之后和第二个方括号之前必须加上一个空格，否则就会报错

```shell
test05() {
    var="Imnt"
    if [ $var ]; then
        echo "返回状态码True"
    else
        echo "返回状态码False"
    fi
}
test05  # 返回状态码True
```

### 数值比较

![](https://raw.githubusercontent.com/JackieDai/blogAssets/main/202408260923597.png)

- eq : equal
- ge: greate or equal
- gt: greate than
- le: less of equal
- lt: less than
- ne: not equal

```shell
test06() {
    if [ $1 -gt $2 ]
    then
        echo "$1 > $2"
    elif [ $1 -ge $2 ]
    then
        echo "$1 >= $2"
    fi
}
test06 2 2
```

### 字符串比较

![image-20240826093025820](/Users/lingxiao/Library/Application Support/typora-user-images/image-20240826093025820.png)

> !!! 大于号和小于号必须转义，否则shell会把它们当作重定向符号，把字符串值当作文件 名;

### 文件比较

![](https://raw.githubusercontent.com/JackieDai/blogAssets/main/202408260934930.png)

#### 检查目录

`-d`测试会检查指定的目录是否存在于系统中。如果你打算将文件写入目录或是准备切换到某 个目录中，先进行测试接着进行操作。

```shell
test07() {
    if [ -d $1 ]; then
        echo "this is directory"
        cd $1
        ls -F
    else
        echo "not a directory"
    fi
}
```

### If--then的高级用法

- 用于**数学表达式的双括号**`(( ... ))`
- 用于**高级字符串处理功能的双方括号**`[[ ... ]]`

#### 双括号

双括号命令允许你在比较过程中使用高级数学表达式;

![](https://raw.githubusercontent.com/JackieDai/blogAssets/main/202408261017810.png)

```shell

test08() {
    var1=10
    if (( $var1 ** 2 > 90 ))
    then
        (( var2 = $var1 ** 2 ))
        # var3=(($var1 ** 2))
        echo "The Square of $var1 is $var2"
    fi
}
test08  # The Square of 10 is 100
```

注意: 

- 双括号里的高级的表达式 的运算和赋值只能在其内部进行！！！否则会报错
- 不需要将双括号中表达式里的大于号转义。这是双括号命令提供的另一个高级特性

#### 双中括号(双方括号)

双方括号命令提供了针对字符串比较的高级特性。双方括号命令的格式: `[[ expression ]]`

> 双方括号里的expression使用了test命令中采用的标准字符串比较。但它提供了test命令未提供的另一个特性——模式匹配(pattern matching)。

```shell
test09() {
    if [[ $USER == l* ]] ## 这里用到了模式匹配
    then
        echo "HELLO $USER"
    else
        echo "sorry, who are u"
    fi
}

test09 ## HELLO lingxiao
```

### case 语句

类似于其他语言的`switch`语句

```shell
test10() {
    case $1 in
    rich | brarbara) # 多个条件可以使用  `|` 分割，相当于  逻辑 或
        echo "Welcome. $1"
        echo "Pls enjoy yourself"
        ;;  ##相当于 break
    testing)
        echo "Sepcial Testing"
        ;;
    jessica)
        echo "I'm $1"
        ;;
    *)  ## 星号(`*`)会捕获所有与已 知模式不匹配的值
        echo "Sorry,you are not allowed"
        ;;
    esac
}
```

## 循环

### for - 循环

```shell
for var in list do
commands
done
```

可以用for命令来自动遍历目录中的文件。进行此操作时，必须在文件名或路径名中 使用通配符`(*)`。它会强制shell使用文件扩展匹配。

```shell
test02() {
    ## 如果想要遍历某一个文件夹下的所有内容,需要使用通配符
    path="/Users/lingxiao/.personal/study_and_code/shell-tutorial/*"

    # path="/Users/lingxiao/.personal/study_and_code/shell-tutorial"

    for file in $path
    do
    		# 这里需要注意下，如果file中包含 空格，需要把`$file` 通过 双引号 `"$file"` 包起来，否则会报错;(bash shell会将额外的单词当作参数，进而造成错误)
        if [ -d "$file" ]; then
            echo "$file is a directory"
        elif [ -f "$file" ]; then
            echo "$file is a raw file"
        fi
    done
}
```

for 循环更多练习,列出系统中所有在 `$PATH` 环境变量中指定目录下的可执行文件

```shell
test04() {
    IFS=:
    for folder in $PATH
    do  
        echo "$folder:"
        for file in $folder/*
        do
            if [ -x $file ]
            then
                echo "   $file"
            fi 
        done
    done
}
```

> 方法中第一行 `IFS=:`解释
>
> **作用**: 将Shell的内部字段分隔符（`IFS`）设置为冒号（`:`）。
>
> **原因**: 在Shell中，`IFS` 用于指定在变量展开和命令替换时，如何分隔字符串。默认情况下，`IFS` 包含空格、制表符和换行符。将其设置为冒号后，可以方便地将 `$PATH` 环境变量按照冒号分隔，遍历其中的每个目录。

### C-Style For循环

需要使用高级运算符 双括号， 同时 双括号 内部的变量 也不需要使用 `$`

```shell
test03() {
    for (( var = 1; var < 10; var++)) ## 注意这里操作 var 不需要添加 `$`符号
    do
        echo "index == $var"
    done
}
```

### while循环

```shell
test01() {
    declare var=0
    while [ $var -lt 10 ]; do
        # ((var++)) ##高级运算符里不需要带`$`
        var=$[ $var + 1 ]
        echo "$var"
    done
}
```

### 循环输出的重定向

如下示例，在循环结束表示`done`后，添加重定向的命令

```shell
test02() {
    ## 如果想要遍历某一个文件夹下的所有内容,需要使用通配符
    path="/Users/lingxiao/.personal/study_and_code/shell-tutorial/*"
    for file in $path
    do
        if [ -d $file ]; then
            echo "$file is a directory"
        elif [ -f $file ]; then
            echo "$file is a raw file"
        fi
    done >> ./Redirections/log.y0823  ## 重定向
}
```

## 处理用户输入

- `$0`: 是程序名

- `$1、$2、...$8、$9、${10}、${11}`：表示输入的参数

- `$#` 表示参数的个数

- `${!#}`获取最后一个参数;

- `$*`和`$@`获取所有的参数

  > 注意 不是 ${$#}, 因为花括号里不能接着放美元符

> 如果只想要获取脚本名称可以使用`basename`命令

```shell
#!/bin/sh
echo "\$0 == $0" #此处获取的是脚本的路径

scriptName=$(basename $0) #此处获取 脚本的文件名称
echo $scriptName 


echo "1 == $1"
echo "2 == $2"
echo "3 == $3"
echo "4 == $4"
echo "5 == $5"
echo "6 == $6"
echo "7 == $7"
echo "8 == $8"
echo "9 == $9"
echo "10 == ${10}"
echo "11== ${11}"
echo "12 == ${12}"

echo "\$# total args count is == $#"

echo "last args var is == ${$#}" ## 出错了last args var is == 69701,方括号里不能出现美元符
echo "last args var is == ${!#}" ## 把美元符改成!就OK last args var is == 12

echo "获取所有参数 \$*-- $*" # 获取所有参数 $*-- 1 2 3 4 5 6 7 8 9 10 11 12
echo "获取所有参数 \$@-- $@" # 获取所有参数 $@-- 1 2 3 4 5 6 7 8 9 10 11 12
```

### `$*`和`$@`的区别

`$*`和`$@`在没有添加引号的时候，两者一样

当添加了引号，`"$*"` 会把所有的参数当成一个字符串，而`"$@"`会把参数当成一个数组

接着上述代码

```shell
## $* 和 $@ 的区别
#
echo "---------\"\$*\"-------"
count=1
#
for param in "$*"
do
   echo "\$* Parameter #$count = $param"
   count=$[ $count + 1 ]
done


echo "---------\"\$@\"-------"
count=1
#
for param in "$@"
do
   echo "\$@ Parameter #$count = $param"
   count=$[ $count + 1 ]
done
```

上述代码输出如下:

```shell
---------"$*"-------
$* Parameter #1 = 1 2 3 4 5 6 7 8 9 10 11 12
---------"$@"-------
$@ Parameter #1 = 1
$@ Parameter #2 = 2
$@ Parameter #3 = 3
$@ Parameter #4 = 4
$@ Parameter #5 = 5
$@ Parameter #6 = 6
$@ Parameter #7 = 7
$@ Parameter #8 = 8
$@ Parameter #9 = 9
$@ Parameter #10 = 10
$@ Parameter #11 = 11
$@ Parameter #12 = 12
```

