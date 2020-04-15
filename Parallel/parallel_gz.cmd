#!/bin/csh

#ls 200908010*.gz   | parallel -I% --max-args 1  -j 6  filter1_gz.cmd
ls 200908010*.gz   | parallel -I% --max-args 1  -j 6  'gunzip -k -f -c  $1  > /dev/null'
