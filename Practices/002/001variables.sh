#!/bin/sh
NAME="lingxiao"
readonly NAME
# NAME = "dai.lingxiao"
# if a variable is marked readonly, its value cannot be changed
echo $NAME

TOKEN="2345678asfsdafasd"

for TOKEN in $*
do
   echo $TOKEN
done
