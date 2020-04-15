#!/bin/csh

# 200908010*_RDR.TAB* must exist

rm -f tmp.*  tmp

# txt
/usr/bin/time -o tmp   parallel_txt.cmd

# bzip2

# gz
/usr/bin/time -o tmp -a  parallel_gz.cmd

# lz4
/usr/bin/time -o tmp -a  parallel_lz4.cmd

# lzma
/usr/bin/time -o tmp -a  parallel_lzma.cmd

# rar

# zip
/usr/bin/time -o tmp -a  parallel_zip.cmd

