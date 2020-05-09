#!/bin/csh

# 200908010*_RDR.TAB* must exist

# name of input file
set fn = 200908010000_RDR.TAB

echo To clear page caches execute 
echo sudo sysctl -w vm.drop_caches=1
echo before running this script

rm -f tmp tmp.20*RDR.TAB*

# txt
/usr/bin/time -o tmp  filter1_txt.cmd  $fn

# br
/usr/bin/time -o tmp -a  filter1_brotli.cmd  $fn.br

# gz
/usr/bin/time -o tmp -a  filter1_gzip.cmd  $fn.gz

# lz4
/usr/bin/time -o tmp -a  filter1_lz4.cmd  $fn.lz4

# lzma
/usr/bin/time -o tmp -a  filter1_lzma.cmd  $fn.lzma

# zip
/usr/bin/time -o tmp -a  filter1_zip.cmd  $fn.zip

# zst
/usr/bin/time -o tmp -a  filter1_zstd.cmd  $fn.zst


