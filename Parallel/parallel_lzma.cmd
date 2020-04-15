#!/bin/csh

#ls 200908010*.lzma | parallel -I% --max-args 1  -j 6  filter1_lzma.cmd
ls 200908010*.lzma | parallel -I% --max-args 1  -j 6  'lzma -d -k -c  $1 > /dev/null'
