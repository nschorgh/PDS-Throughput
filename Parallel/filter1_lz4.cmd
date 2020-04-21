#!/bin/csh

# decompress and filter one file

lz4 -d -c $1 | awk '{if ($26>120.0 && $26<120.1) print}' > tmp.$1
#lz4 -d -c $1 | awk '{if ($26>120.0 && $26<120.1) print}' > /dev/null
#lz4 -d $1  tmp.$1
#lz4 -d -c $1  > tmp.$1
#lz4 -d -c $1  > /dev/null
