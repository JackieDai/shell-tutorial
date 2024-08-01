#!bin/sh


echo "-----------------if decesion_making--------------------"

echo "Pls input an interger value:"
read number

# NOTE: the conditional expression in if and elif, shoule end with `;`, and followed by then  
if [ $number -gt 10 ]; then
    echo " this number is greater than 10"
elif [ $number -eq 10 ]; then
    echo "this number is equal to 10"
else
    echo "this number value is $number which is invalid "
fi


echo "--------------case decesion marking----------------"

echo "pls input a char:"
read char

# attention: the syntax
case $char in
    [a-z])
        echo "小写字母"
        ;;
    [A-Z])
        echo "大写字母"
        ;;
    [0-9])
        echo "数字"
        ;;
    *)
        echo "其他字符"
        ;;
esac


