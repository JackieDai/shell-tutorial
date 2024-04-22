#!/bin/bash
a=10
b=20

echo "===============0================"
if [ $a != $b ] 
then
    echo "a is not equal to b"
fi

if [ $a == $b ] 
then
    echo "a is equal to b"
fi
echo "===============1================"

if [ $a == $b ] 
then
    echo "a is equal to b"
else
    echo "a is not equal to b"
fi

echo "===============2==============="
if [ $a == $b ]
then
   echo "a is equal to b"
elif [ $a -gt $b ]
then
   echo "a is greater than b"
elif [ $a -lt $b ]
then
   echo "a is less than b"
else
   echo "None of the condition met"
fi


echo "===============3==============="

FRUIT="Banana"
case "$FRUIT" in
    "Apple") echo "Hell is Apple"
    ;;
    "Banana") echo "HHH is Banana"
    ;;
esac