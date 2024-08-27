#!/bin/sh

test01() {
    # list=$*
    list=$@
    for item in $list; do
        echo "item == $item"
    done
}

# test01 1 3 4 "jackie" "dai"

## item == 1
## item == 3
## item == 4
## item == jackie
## item == dai

test02() {
    ## 如果想要遍历某一个文件夹下的所有内容,需要使用通配符
    path="/Users/lingxiao/.personal/study_and_code/shell-tutorial/*"

    # path="/Users/lingxiao/.personal/study_and_code/shell-tutorial"

    for file in $path
    do
        if [ -d $file ]; then
            echo "$file is a directory"
        elif [ -f $file ]; then
            echo "$file is a raw file"
        fi
    done >> ./Redirections/log.y0823  ## 重定向
}



# test02

test03() {
    for (( var = 1; var < 10; var++)) ## 注意这里操作 var 不需要添加 `$`符号
    do
        echo "index == $var"
    done
}
# test03

test04() {
    IFS=:
    for folder in $PATH
    do  
        echo "$folder:"
        for file in $folder/*
        do
            if [ -x $file ]
            then
                echo "   $file"
            fi 
        done
    done
}
test04