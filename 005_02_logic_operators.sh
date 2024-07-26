#!bin/sh

# relationship operation symbols

a=12
b=24

echo "-ne represents not equal"
if [ $a -ne $b ]; then
    echo "a == $a, b == $b"
fi


a=$b
echo "-eq or == represents equal"
if [ $a -eq $b ]; then
    echo "\t $a == $b"
else
    echo "\t $a != $b"
fi
if [ $a == $b ]; then
    echo "\t $a == $b"
else
    echo "\t $a != $b"
fi

a=100
echo "-gt represents greater than"
if [ $a -gt $b ]; then
    echo "\t a is greater than b"
fi

echo "-lt represents less than"
a=1
if [ $a -lt $b ]; then
    echo "\t a is less than b"
fi

echo "-ge represents greater than or equal to"

a=24
if [ $a -ge $b ]; then
    echo "\t a == $a is equal to b == $b"
fi

a=25
if [ $a -ge $b ]; then
    echo "\t a ==$a is greater than b == $b"
fi

# for more, review the reference link: https://www.tutorialspoint.com/unix/unix-relational-operators.htm