#!bin/sh


###### string Operators
echo "--------------string Operators---------------"
a=abc
b=efg
if [ $a -eq $b ]; then
    echo "a == b"
else
    echo "a != b"
fi

if [ $a != $b ]; then
    echo "a != b"
else
    echo "a == b"
fi

echo "-z represents check the str length is zero"
a=""
if [ -z $a ]; then  
    echo "\t string_a length is zero"
else
    echo "\t string_a length is greater than zero"
fi

echo "-n represents check the str length is non-zero"
e="I'malmostcrazy"
if [ -n $e ]; then
    echo "\t string_e length is non-zero"
else    
    echo "\t string_e length is zero"
fi

echo "[ $str ] represents whether the str is empty"
if [ $e ]; then
    echo "\t not empty"
else
    echo "\t str is empty"
fi


# for more detail, pls review reference link: https://www.tutorialspoint.com/unix/unix-string-operators.htm