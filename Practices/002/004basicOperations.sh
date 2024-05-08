#!/bin/sh

echo $0

# val=$(expr 2 + 2)
val=`expr 2 + 2`
echo "val is $val"

## https://www.tutorialspoint.com/unix/unix-basic-operators.html  ； This link is about more operations.

a=20
b=30

## Addition
echo "=========Addition========="

res=`expr $a + $b`
echo "res is $res" # res is 50


echo "=========Subtraction========="
res=`expr $a - $b`
echo "res is $res" # res is -10


echo "=========multiplication========="
## NOTE : \ proceed in *
res=`expr $a \* $b`  
echo "res is $res" # res is 600


echo "========Division=========="
a_=40
b_=20
res=`expr $a_ / $b_`  
echo "res is $res" # res is 2


echo "========Modulus=========="
# res=`expr $b % $a`
res=`expr $a % $b`
echo "res is $res"

echo "========Assignment=========="
c=`expr $a + $b`
echo "c is $c" ##c is 50

echo "========Equality Or Not=========="
if [ $a == $b ] 
then
    echo "a == b"
fi

if [ $a != $b ] 
then
    echo "a != b"
fi

echo "========-eq=========="

