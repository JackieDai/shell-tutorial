#!bin/sh

echo "---------------------TEST_0   $0----------------------"
TEST_0() {
   echo "current name --- $0"  # current name --- 003_sepcial_vars.sh
}
TEST_0

echo "---------------------TEST_1   $n----------------------"

TEST_1() {
   # `$n`, these variables correspond to agrs with which a script invoked.
   echo "1th var is: $1"
   echo "2th var is: $2"
   echo "3th var is: $3"

   # 1th var is: arg_1
   # 2th var is: arg_2
   # 3th var is: arg_3 

}
TEST_1 arg_1 arg_2 arg_3

echo "---------------------TEST_2    $#----------------------"

TEST_2() {
   # `$#` represents the total number of args
   echo "the total args count is $#"
}
TEST_2 arg1 arg2 arg3

echo "---------------------TEST_3    $*----------------------"
TEST_3() {
   echo "the total args count is [[$*]]"
   # the total args count is [[arg1 arg2 arg3]]
   for item in $*; do
      echo "item is $item"
   done
   # item is arg1
   # item is arg2
   # item is arg3

   echo "-----"
   for item in "$*"; do
      echo "item_second is $item"
   done

   # item_second is arg1 arg2 arg3

}
TEST_3 arg1 arg2 arg3


echo "---------------------TEST_4    $@----------------------"
TEST_4() {
   echo "the total args count is [[$@]]"
   # the total args count is [[t4_1 t4_2 t4_3]]

   for t4 in $@; do
      echo "t4 is $t4"
   done
   # item is t4_1
   # item is t4_2
   # item is t4_3

   echo "-----"
   for t4 in "$@"; do
      echo "t4_second is $t4"
   done

   # item_second is t4_1
   # item_second is t4_2
   # item_second is t4_3

   # return 10
}

TEST_4 t4_1 t4_2 t4_3


# The exit status of the last command executed.
# if TEST_4 return 10 then $? = 10
echo "? === $?"

