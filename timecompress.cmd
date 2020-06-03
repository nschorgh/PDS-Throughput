#!/bin/csh
# measure times for file compression

# name of input file
set fn = 200908010000_RDR.TAB

# do not use shell built-in time command, instead use /usr/bin/time

rm -f  $fn*.br $fn.bz2 $fn.gz $fn*.lz4 $fn*.lzma $fn.zip $fn*.zst 
rm -f tmp
touch tmp

# fill cache to be fair
cp $fn tmp.tab
rm -f tmp.tab


# brotli
/usr/bin/time -o tmp -a  brotli -k $fn
/usr/bin/time -o tmp -a  brotli -k -9 $fn -o $fn-lev9.br
/usr/bin/time -o tmp -a  brotli -k -q 10 $fn -o $fn-lev10.br

# bzip2
/usr/bin/time -o tmp -a  bzip2 -z -k $fn

# gzip
/usr/bin/time -o tmp -a  gzip -k $fn 

# lz4
/usr/bin/time -o tmp -a  lz4 -k -q $fn 
/usr/bin/time -o tmp -a  lz4 -9 -k -q $fn $fn-lev9.lz4

# lzma 
/usr/bin/time -o tmp -a  lzma -k $fn
rm -f $fn.lzma
/usr/bin/time -o tmp -a  lzma -9 -k $fn
mv $fn.lzma $fn-lev9.lzma
/usr/bin/time -o tmp -a  lzma -9 -k -e $fn
mv $fn.lzma $fn-lev9e.lzma

# zip
/usr/bin/time -o tmp -a  zip -q $fn.zip  $fn

# zstd
/usr/bin/time -o tmp -a  zstd -q $fn
/usr/bin/time -o tmp -a  zstd -16 -q $fn -o $fn-lev16.zst 
/usr/bin/time -o tmp -a  zstd -19 -q $fn -o $fn-lev19.zst 

