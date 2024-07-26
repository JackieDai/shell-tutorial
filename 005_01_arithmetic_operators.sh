#!bin/sh

# The Bourne didn't originally have any mechainism to perform simple arithmetic.
# It use external programs, to do this arithmetic operatons

var=`expr 2 + 2`  # NOTE:  this use backtick ``
echo "var == $var"




# for more , review the reference link: https://www.tutorialspoint.com/unix/unix-arithmetic-operators.htm

a=20
b=30

res=`expr $a + $b`
echo "a + b = $res"

res=`expr $a - $b`
echo "a - b = $res"

res=`expr $a \* $b`
echo "a * b = $res"

res=`expr $b / $a`
echo "b / a = $res"

res=`expr $b % $a`
echo "b % a = $res"

if [ $a == $b ]; then
    echo "a == b"
else
    echo "a != b"
fi

