#!bin/sh

echo "The Boolean Operations are as follows"

# !=
echo "! represents logic negation"
a=20
if [ $a != $b ]; then
    echo "\t a != b"
fi

# -o
echo "-o represents logic or"

if [ $a -gt 18 -o $b -lt 30 ]; then
    echo "\t a > 18 or b < 30"
else
    echo "\t not in the limit"
fi

# -a
echo "-a represents logic and"
if [ $a -eq 20 -a $b -lt 30 ]; then
    echo "\t a == 20, b < 30"
else
    echo "\t not in the limit"
fi

# for more detail, pls review reference link: https://www.tutorialspoint.com/unix/unix-boolean-operators.htm