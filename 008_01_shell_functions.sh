#!bin/sh

# define your func here
HELLO() {
    echo "Hello world, i'm lingxiao $1 and $2"
    return 10
    # exit
}

# invoke your func
HELLO zhiyi chunli
# Hello world, i'm lingxiao zhiyi and chunli

# echo "0000----------"
res=$?

echo "res == $res"  # res == 10