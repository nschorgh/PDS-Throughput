#!/bin/csh

# decompress and filter one file

brotli -d -c -k $1 | awk '{if ($26>120.0 && $26<120.1) print}' > tmp.$1
