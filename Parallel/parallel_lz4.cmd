#!/bin/csh

#ls 200908010*.lz4 | parallel -I% --max-args 1  -j 6   filter1_lz4.cmd
ls 200908010*.lz4 | parallel -I% --max-args 1  -j 6   'lz4 -d -c $1 > /dev/null'
