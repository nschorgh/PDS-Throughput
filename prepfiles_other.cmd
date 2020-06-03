#!/bin/csh

# compression to other than default level
# files with standard names may be overwritten
# final files contain *-lev* in filename

set fn = 200908010000_RDR.TAB
#set fn = 201601010000_RDR.TAB

rm -f $fn-lev*.*

# ordered by file extension

# brotli -11 (1..11)
brotli -k -4 $fn -o $fn-lev4.br
brotli -k -9 $fn -o $fn-lev9.br
brotli -k -q 10 $fn -o $fn-lev10.br


# bzip2 -9 (1..9)
bzip2 -1 -z -k $fn
mv $fn.bz2 $fn-lev1.bz2


# gzip -6 (1..9)
gzip -1 -k $fn
mv $fn.gz $fn-lev1.gz

gzip -9 -k $fn
mv $fn.gz $fn-lev9.gz


# lz4 -1 (1..12)
lz4 -9 -k -q  $fn  $fn-lev9.lz4
lz4 -12 -k -q  $fn  $fn-lev12.lz4


# lzma -6 (0..9)
lzma -0 -k $fn
mv $fn.lzma $fn-lev0.lzma
lzma -9 -T6 -k $fn
mv $fn.lzma $fn-lev9.lzma
lzma -k -e $fn
mv $fn.lzma $fn-lev6e.lzma
lzma -9 -T6 -k -e $fn
mv $fn.lzma $fn-lev9e.lzma


# rar -m3 (0..5)
# level 0 means no compression
rar a -m1 $fn-lev1.rar $fn
rar a -m5 $fn-lev5.rar $fn


# zip -6  (0..9)
# level 0 means no compression
zip -1  $fn-lev1.zip $fn
zip -9  $fn-lev9.zip $fn


# zstd -3 (1..19)
zstd -15 -T6  $fn -o $fn-lev15.zst
zstd -16 -T6  $fn -o $fn-lev16.zst
zstd -19 -T6  $fn -o $fn-lev19.zst



# list file sizes
# ls -l $fn* | awk '{print $9,"\t"$5}' >! tmp

