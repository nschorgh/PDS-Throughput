#!/bin/csh

# 200908010*_RDR.TAB* must exist

# make sure the directory contains the expected number of files
ls -l 200908010*.TAB | wc
ls -l 200908010*.gz | wc
ls -l 200908010*.lz4 | wc
ls -l 200908010*.lzma | wc
ls -l 200908010*.zip | wc
ls -l 200908010*.zst | wc

echo To clear disk buffer execute 
echo sudo sysctl -w vm.drop_caches=1
echo before running this script


rm -f tmp tmp.2009*RDR.TAB*

# txt
/usr/bin/time -o tmp  csh -c 'ls 200908010*.TAB | parallel -X -I% --max-args 1  -j 3   filter1_txt.cmd'

# bzip2

# gz
/usr/bin/time -o tmp -a  csh -c 'ls 200908010*.gz  | parallel -X -I% --max-args 1  -j 3  filter1_gz.cmd'

# lz4
/usr/bin/time -o tmp -a  csh -c 'ls 200908010*.lz4 | parallel -X -I% --max-args 1  -j 3  filter1_lz4.cmd'

# lzma
/usr/bin/time -o tmp -a  csh -c 'ls 200908010*.lzma | parallel -X -I% --max-args 1  -j 3  filter1_lzma.cmd'

# rar

# zip
/usr/bin/time -o tmp -a  csh -c 'ls 200908010*.zip | parallel -X -I% --max-args 1  -j 3   filter1_zip.cmd'

# zst
/usr/bin/time -o tmp -a  csh -c 'ls 200908010*.zst | parallel -X -I% --max-args 1  -j 3   filter1_zst.cmd'



#mv tmp times_filter.threads
