#!/bin/sh

test01() {
    declare var=0
    while [ $var -lt 10 ]; do
        # ((var++)) ##高级运算符里不需要带`$`
        var=$[ $var + 1 ]
        echo "$var"
    done
}
# test01

# test02(){
#     input="users.csv"
#     while IFS=',' read -r userid name
#     do
#         echo "adding $userid"
#         useradd -c "$name" -m $userid
#     done < "$input"
# }
# test02

