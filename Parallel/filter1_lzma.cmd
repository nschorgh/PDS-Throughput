#!/bin/csh

# lzma
lzma -d -k -c  $1 | awk '{if ($26>120.0 && $26<120.1) print}' > tmp.$1
#lzma -d -k -c  $1  > /dev/null
