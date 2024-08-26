#!/bin/sh

function cmdSubstitution() {
    testStr=`date`
    echo "CurrentDate is $testStr"

    testStr2=$(date)
    echo "date--- is $testStr2"
}

# cmdSubstitution

function cmdSubstitution2() {
    today=$(date +y%m%d)
    ls /usr/bin > ./Redirections/log.$today

    cat ./Redirections/log.$today
}

# cmdSubstitution2