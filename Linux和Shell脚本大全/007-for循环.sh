#!/bin/sh

test01() {
    list=$*
    for item in $list; do
        echo "item == $item"
    done
}

test01 1 3 4 "jackie" "dai"

## item == 1
## item == 3
## item == 4
## item == jackie
## item == dai