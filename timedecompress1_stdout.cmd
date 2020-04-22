#!/bin/csh
# measure times for file decompression

# name of input file
set fn = 200908010000_RDR.TAB
#set fn = dgdr_tbol_avg_poln_20090810n_240_img.img

# input files must exist
# prepfiles.cmd creates these files

echo To clear disk buffer execute 
echo sudo sysctl -w vm.drop_caches=1
echo before running this script

rm -f tmp

# do not use shell built-in time command, instead use /usr/bin/time

# txt
/usr/bin/time -o tmp -a  cat $fn > tmp_tab

# bzip2
/usr/bin/time -o tmp -a  bzip2 -d -k -c $fn.bz2 > tmp_bz

# gzip
/usr/bin/time -o tmp -a  gunzip -k -c $fn.gz > tmp_gz 

# lz4
/usr/bin/time -o tmp -a  lz4 -d -c $fn.lz4 > tmp_lz4

# lzma 
/usr/bin/time -o tmp -a  lzma -d -k -c $fn.lzma > tmp_lzma

# rar
/usr/bin/time -o tmp -a  unrar p -inul $fn.rar > tmp_rar

# zip
/usr/bin/time -o tmp -a  unzip -c -q $fn.zip  > tmp_zip

# zstd
/usr/bin/time -o tmp -a  unzstd -c -q $fn.zst > tmp_zst


rm -f tmp_?z tmp_??? tmp_lzma
