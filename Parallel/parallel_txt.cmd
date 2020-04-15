#!/bin/csh

#ls 200908010*.TAB | parallel -I% --max-args 1  -j 6   filter1_txt.cmd
ls 200908010*.TAB | parallel -I% --max-args 1  -j 6   'cat $1 > /dev/null'
