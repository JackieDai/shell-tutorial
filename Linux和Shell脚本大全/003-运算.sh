#!/bin/sh
a=10
b=20
c=5
res=$[$a * $b / ( $b / $a ) + $c]
echo $res
