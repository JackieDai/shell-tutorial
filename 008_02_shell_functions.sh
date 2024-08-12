#!bin/bash

: <<'EOF'
上文中我们已经知道 可以通过 `$?` 来获取上一个函数的执行结果(或者叫返回值)
但是这种返回值使用比较繁琐，接下来，我们看一下其他方法
EOF

ADDFUNC() {

    local res=$(expr $1 + $2)
    return $res # 返回状态码
}

ADDFUNC1_ECHO() {

    local res=$(expr $1 + $2)

    # echo "1234"

    echo $res # 使用echo来输出结果，然后使用命令替换将输出结果赋值给变量。

    # pwd

    # NOTE: 第一个 echo 会作为返回值，赋给调用此函数的 变量
}

ADDFUNC 1 2
res=$?  ## 获取上一步函数的状态码
echo "func 001 is $res"

RES=$(ADDFUNC 2 3)
echo "ADDFUNC 2 3 == $RES" ## 这里啥也没有输出

: << 'EOF'
在Shell脚本中，return语句的作用是返回函数的退出状态码（即一个0-255之间的整数），而不是返回计算结果。因此，不能直接通过return语句来将函数的计算结果传递给变量。

为了将函数的计算结果赋给变量，你应该使用echo来输出结果，然后使用命令替换将输出结果赋值给变量。
EOF


num1=4
num2=5
res2=$(ADDFUNC1_ECHO $num1 $num2)
echo "func 003 is $res2"

