#!/bin/csh

# 200908010*_RDR.TAB* must exist

# make sure the directory contains the expected number of files
ls  200908010*.TAB | wc
ls  200908010*.br | wc
ls  200908010*.gz | wc
ls  200908010*.lz4 | wc
ls  200908010*.lzma | wc
ls  200908010*.zip | wc
ls  200908010*.zst | wc

echo To clear page caches execute 
echo sudo sysctl -w vm.drop_caches=1
echo before running this script


rm -f tmp tmp.2009*RDR.TAB*

# txt
/usr/bin/time -o tmp  csh -c 'ls 200908010*.TAB | parallel -X -I% --max-args 1  -j 6   filter1_txt.cmd'

# brotli
/usr/bin/time -o tmp -a  csh -c 'ls 200908010*.br  | parallel -X -I% --max-args 1  -j 6  filter1_brotli.cmd'

# gzip
/usr/bin/time -o tmp -a  csh -c 'ls 200908010*.gz  | parallel -X -I% --max-args 1  -j 6  filter1_gzip.cmd'

# lz4
/usr/bin/time -o tmp -a  csh -c 'ls 200908010*.lz4 | parallel -X -I% --max-args 1  -j 6  filter1_lz4.cmd'

# lzma
/usr/bin/time -o tmp -a  csh -c 'ls 200908010*.lzma | parallel -X -I% --max-args 1  -j 6  filter1_lzma.cmd'

# zip
/usr/bin/time -o tmp -a  csh -c 'ls 200908010*.zip | parallel -X -I% --max-args 1  -j 6   filter1_zip.cmd'

# zstd
/usr/bin/time -o tmp -a  csh -c 'ls 200908010*.zst | parallel -X -I% --max-args 1  -j 6   filter1_zstd.cmd'



#mv tmp times_filter.threads
