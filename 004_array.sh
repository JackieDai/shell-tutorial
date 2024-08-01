#!bin/sh

# Define array
TEST0() {
    ARR[0]="Jackie"
    ARR[1]="Dai"
    ARR[2]="LingXia0"

    echo "ARR is ${ARR[*]}"

    for item in ${ARR[*]}; do
        echo "item 00 == $item"
    done

    for item in ${ARR[@]}; do
        echo "item 111 == $item"
    done

    # NOTE:
    # ACCESS ARR Via `${ARR[*]}` or `${ARR[@]}`
}
TEST0

echo "-----------------------"

# Define ARR
TEST1() {
    local my_array=("apple" "banana" "cherry")
    echo "${my_array[@]}"
    # return ${my_array[@]}  ### Question: 函数的返回值，应该怎么使用？
}
# TEST1
# arr=$?
# echo "dddd === ${arr[*]}"

TEST2() {
    # 调用方法并捕获返回的数组
    array=($(TEST1))  # ********通过 $(TEST1) 来调用方法并捕获其输出，将其赋值给数组 array。
    echo "array_result == ${array[*]}"
    # 访问数组元素
    for element in ${array[@]}; do
        echo "$element"
    done

    for element in ${array[*]}; do
        echo "$element"
    done
}

TEST2