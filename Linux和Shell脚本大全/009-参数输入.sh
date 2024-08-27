#!/bin/sh
echo "\$0 == $0"

scriptName=$(basename $0)
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
