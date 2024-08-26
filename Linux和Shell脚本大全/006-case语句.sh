#!/bin/sh

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
test10 123