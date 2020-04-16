#!/bin/csh
# measure times for file decompression

# name of input file
set fn = 200908010000_RDR.TAB
#set fn = dgdr_tbol_avg_poln_20090810n_240_img.img

# input files must exist
# prepfiles.cmd creates these files

rm -f tmp

# do not use shell built-in time command; instead use /usr/bin/time 

# only copy file
/usr/bin/time -o tmp -a  cp $fn tmp.tab
rm -f tmp.tab

# bzip2
rm -f $fn
/usr/bin/time -o tmp -a  bzip2 -d -k $fn.bz2

# gzip
rm -f $fn
/usr/bin/time -o tmp -a  gunzip -k $fn.gz 

# lz4
rm -f $fn
/usr/bin/time -o tmp -a  lz4 -d $fn.lz4 

# lzma 
rm -f $fn
/usr/bin/time -o tmp -a  lzma -d -k $fn.lzma 

# rar
rm -f $fn
/usr/bin/time -o tmp -a  unrar e $fn.rar 

# zip
rm -f $fn
/usr/bin/time -o tmp -a  unzip $fn.zip 

# zst
rm -f $fn
/usr/bin/time -o tmp -a  unzstd $fn.zst
 
