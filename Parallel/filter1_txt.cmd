#!/bin/csh

# read and filter one file

# TAB 
awk '{if ($26>120.0 && $26<120.1) print}' $1  > tmp.$1
#cat $1  > /dev/null
