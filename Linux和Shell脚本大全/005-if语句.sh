#!/bin/sh

test01() {
    
    if pwd; then
        echo "It works ('if' and 'then' locate at some line, must using "\;" to seperation)"
    fi

    if pwd
    then
        echo "It works"
    fi
}

# test01

test02() {
    testuser=lingxiao

    if grep $testuser /etc/passwd; then
        echo "This is first cmd"
        echo "This is second cmd"
        ls -a /home/$testuser/.b*
    else
        echo "no users"
    fi
    echo "--------------"
}

# test02

test03() { 

    if (( $1 == 1 )); then
        echo "fist"
    elif (( $1 == 2 )); then
        echo "second"
    else
        echo "no body using"
    fi
}

# test03 1
# test03 2
# test03 3

test04() {
    var="FUll"
    if test $var; then
        echo "返回状态码True"
    else
        echo "返回状态码False"
    fi
}
# test04

test05() {
    var="Imnt"
    if [ $var ]; then
        echo "返回状态码True"
    else
        echo "返回状态码False"
    fi
}
# test05  # 返回状态码True

test06() {
    if [ $1 -gt $2 ]
    then
        echo "$1 > $2"
    elif [ $1 -ge $2 ]
    then
        echo "$1 >= $2"
    fi
}

# test06 2 2

test07() {

    if [ -d $1 ]; then
        echo "this is directory"
        cd $1
        ls -F
    else
        echo "not a directory"
    fi
}

# test07 "/Users/lingxiao"

test08() {
    var1=10
    if (( $var1 ** 2 > 90 )) #里面的$可以省略
    then
        (( var2 = $var1 ** 2 )) # 左侧给var2赋值的时候不能省略,右侧可以omit

        # var3=(($var1 ** 2))

            # The Square of 10 is var2 == 100 
        echo "The Square of $var1 is var2 == $var2 "
    fi
}
test08  # The Square of 10 is 100

test09() {
    if [[ $USER == l* ]] ## 这里用到了模式匹配
    then
        echo "HELLO $USER"
    else
        echo "sorry, who are u"
    fi
}

# test09 ## HELLO lingxiao

test10() {
    case $1 in
    rich | brarbara) # 多个条件可以使用  `|` 分割，相当于  逻辑 或
        echo "Welcome. $1"
        echo "Pls enjoy yourself"
        ;;  ##相当于 break
    testing)
        echo "Sepcial Testing"
        ;;
    jessica)
        echo "I'm $1"
        ;;
    *)  ## 星号(`*`)会捕获所有与已 知模式不匹配的值
        echo "Sorry,you are not allowed"
        ;;
    esac
}
# test10 rich
# test10 brarbara
# test10 testing
# test10 jessica
# test10 123