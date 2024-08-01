#!bin/sh

# The Bourne didn't originally have any mechainism to perform simple arithmetic.
# It use external programs, to do this arithmetic operatons, such as awk or expr

var=`expr 2 + 2`  # NOTE:  this use backtick(反引号) ``
echo "var == $var"




# for more , review the reference link: https://www.tutorialspoint.com/unix/unix-arithmetic-operators.htm



TEST0() {
    a=20
    b=30
    res=`expr $a + $b`
    echo "a + b = $res"
}
TEST0


TEST1() {
    a=20
    b=30
    res=`expr $a - $b`
    echo "a - b = $res"
}
TEST1


TEST2() {
    a=10
    b=20
    res=`expr $a \* $b` #NOTE: 需要转义符
    echo "a * b = $res" 
}
TEST2

TEST3() {
    a=10
    b=5
    res=`expr $a / $b`
    echo "a / b = $res"
}
TEST3

TEST4() {
    a=8
    b=5
    res=`expr $a % $b`
    echo "a % b = $res"
}
TEST4

TEST5() {
    a=1
    b=2
    if [ $a == $b ]; then
        echo "a == b"
    elif [ $a -gt $b ]; then
        echo "a > b"
    elif [ $a -lt $b ]; then
        echo "a < b"
    else
        echo "a != b"
    fi

    if [ $a != $b ]; then
        echo "a != b === "
    fi


    if [ $a -ne $b ]; then 
        echo "a not equal to b"
    fi
}

TEST5

# res=`expr $b % $a`
# echo "b % a = $res"

# if [ $a == $b ]; then
#     echo "a == b"
# else
#     echo "a != b"
# fi

