#!bin/sh

NAME[0]="lingxiao"
NAME[1]="aming"
# should be ${...} formatter when accessing ARR
echo "arr0 == ${NAME[0]}"
echo "arr1 == ${NAME[1]}"

echo "you can access all data of arr via \${arr_name[\*]} of \${arr_name[\@]}"

echo "all arr == ${NAME[*]}"

echo "or"
echo "all arr == ${NAME[@]}"
