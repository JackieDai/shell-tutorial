#!/bin/bash

echo "File Name: $0" ## The filename of the current script.
echo "First Parameter : $1" ## means 1th arg
echo "Second Parameter : $2" ## means 2th arg
echo "Quoted Values: $@" ## meas all args inputed
echo "Quoted Values: $*" ## the same to $@
echo "Total Number of Parameters : $#" ## the count of args

## if u want to excute the above code, you should input `sh ..filename..sh lingxiao t0 t1` , and see the console after excution.

## The CMD: `sh specialVariables.sh lingxiao t0 t1`
## THE Result :
    # File Name: specialVariables.sh
    # First Parameter : lingxiao
    # Second Parameter : t0
    # Quoted Values: lingxiao t0 t1
    # Quoted Values: lingxiao t0 t1
    # Total Number of Parameters : 3

echo "seperator =====  "

# `$* == $@` in the follow code

# for TOKEN in $*
for TOKEN in $@
do
    # echo "current State == $?"
   echo $TOKEN
done

## THE Result is:
    # lingxiao
    # t0
    # t1


echo $? # if $? == 0, means the cmd excuted successful.