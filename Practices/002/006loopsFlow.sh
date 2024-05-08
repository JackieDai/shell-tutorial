#!/bin/bash

# TODO: @lingxiao https://www.tutorialspoint.com/unix/unix-shell-loops.htm

echo "===============While================"
a=0
while [ $a -lt 10 ]
do
    echo $a
    a=`expr $a + 1`
done

echo "===============for================"
# 直接遍历
# for item in 0 1 2 3 4 5 6 7 8 9
# do
#     echo "for-item == $item"
# done

# 遍历数组 01
declare -a my_array=(oo0 oo1 oo2 oo3 oo4 oo5 oo6 oo7 oo8 oo9)
# for item in ${my_array[*]}; do
for item in ${my_array[@]}; do
    echo "for-item == $item"
done

# 遍历数组 02
# array_len=${my_array[@]}
# echo "array_len == $array_len"

array_len=${#my_array[@]} #Not this is get the count of arr
echo "array_len == $array_len"

for ((i = 0; i < array_len; i++))
do
    echo "ddd ${my_array[i]}"
done

echo "======练习======"
for FILE in $HOME/.bash*
do
    echo "FILE is $FILE"
    # FILE is /Users/lingxiao/.bash_history
    # FILE is /Users/lingxiao/.bash_profile
    # FILE is /Users/lingxiao/.bash_sessions
done

echo "=====until----"
a=0
# If the resulting value is false, given statement(s) are executed. If the command is true then no statement will be executed and the program jumps to the next line after the done statement.
until [ ! $a -lt 10 ] #条件不成立时 执行循环体，否则跳出循环
do
   echo $a
   a=`expr $a + 1`
done

echo "last times==$a"


echo "=====select==========="
select DRINK in tea cofee water juice appe all none
do
   case $DRINK in
      tea|cofee|water|all) 
         echo "Go to canteen"
         ;;
      juice|appe)
         echo "Available at home"
      ;;
      none) 
         break 
      ;;
      *) echo "ERROR: Invalid selection" 
      ;;
   esac
done

