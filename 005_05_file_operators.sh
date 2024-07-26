#!bin/sh

# for more detail , pls review reference link: https://www.tutorialspoint.com/unix/unix-file-operators.htm

file="/Users/lingxiao/Desktop/test.sh"


echo "current file name == $0"
 
if [ -r $file ] # Checks if file is readable;
then
   echo "File has read access"
else
   echo "File does not have read access"
fi

if [ -w $file ] # Checks if file is writable; i
then
   echo "File has write permission"
else
   echo "File does not have write permission"
fi

if [ -x $file ] # Checks if file is executable;
then
   echo "File has execute permission"
else
   echo "File does not have execute permission"
fi

if [ -f $file ] # Checks if file is an ordinary file as opposed to a directory or special file
then
   echo "File is an ordinary file"
else
   echo "This is sepcial file"
fi

if [ -d $file ] # Checks if file is a directory
then
   echo "File is a directory"
else
   echo "This is not a directory"
fi

if [ -s $file ] # Checks if file has size greater than 0
then
   echo "File size is not zero"
else
   echo "File size is zero"
fi

if [ -e $file ]  # Checks if file exists;
then
   echo "File exists"
else
   echo "File does not exist"
fi