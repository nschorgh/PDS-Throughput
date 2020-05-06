#!/bin/csh

# zstd
zstd -d -c -q $1 | awk '{if ($26>120.0 && $26<120.1) print}' > tmp.$1
