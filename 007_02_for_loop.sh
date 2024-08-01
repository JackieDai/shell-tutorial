#!bin/sh

for var in 1 2 3 4 5 6 7 8 9 10; do
    echo "var == $var"
done

for FILE in $HOME/.bash*; do
    echo "FILE == $FILE"
done

