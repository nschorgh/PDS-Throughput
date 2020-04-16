#!/bin/tcsh
# compress one file into various formats

# name of input file
set fn = 200908010000_RDR.TAB
#set fn = dgdr_tbol_avg_poln_20090810n_240_img.img

rm -f $fn.bz2 $fn.gz $fn.lz4 $fn.lzma $fn.rar $fn.zip $fn.zst

# ordered according to file extension
# -default level (range of levels)

# bzip2 -9 (1..9)
bzip2 -z -k $fn

# gzip -6 (1..9)
gzip -k $fn 

# lz4 -1 (1..9)
lz4 -k $fn

# lzma -6 (0..9)  slow
lzma -k $fn

# rar -m3 (0..5)
rar a $fn.rar $fn

# zip -6  (0..9)
zip $fn.zip $fn

# zstd -3 (1..19)
zstd $fn -o $fn.zst


# list file sizes
#ls -l $fn* | awk '{print $9,"\t"$5}' >! tmp
