function func_1 { # 名称后没有小括号
    echo "hello world 001"  
}
# func_1  ## hello world 001

func_2() { ## 名称后面会有 小括号
    echo "hello world 002"  
}
# func_2 ## hello world 002

loop_test() {
    count=0
    while [ $count -lt 10 ]
    do
        count=$[ $count + 1 ]
        echo "count == $count"
    done
}

# loop_test

# echo $?  ## 0

double_value() {
    read -p "Enter a value: " value  ## -p 选项允许你在读取用户输入之前显示一个提示信息（prompt）。在这里，提示信息是 "Enter a value: "。
    echo "Doubling The Value"
    return $[ $value * 2 ]
}

# double_value
# echo "The New Value is $?"

function double_value2 {
    read -p "Enter a value: " value
    echo "Doubling The Value111"
    echo "0000000"
    echo "-----"
    echo $[ $value * 2 ]
}

result=$(double_value2)

echo "The New Value2 is $result"