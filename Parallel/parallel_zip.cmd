#!/bin/csh

#ls 200908010*.zip | parallel -I% --max-args 1  -j 6  filter1_zip.cmd
ls 200908010*.zip | parallel -I% --max-args 1  -j 6   'unzip -c  $1 > /dev/null'

# zcat = unzip -c 
