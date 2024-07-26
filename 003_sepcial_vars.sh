#!bin/sh
echo "current name $0"

echo "first arg: $1"
echo "second arg: $2"

echo "total args count : $#"

echo "-----"

echo "all is $*" #  

echo "-----"

echo "@ is $@" #   

echo "-----"

echo "? === $?"


for TOKEN in $*
do
   echo $TOKEN
done


for TOKEN in $@
do
   echo $TOKEN
done