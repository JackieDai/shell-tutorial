#!/bin/sh

function test1() {
    echo $(date)
}

test1
echo $? ## 0

function test2() {
    echo $(who)
    exit 5 ## 这里就已经退出了 当前Shell 进程
}
test2

# 注意一下的代码不会被执行
echo $?

# 这里的也不会被执行
echo $(cal)
exit 8
echo "--------"
echo $?