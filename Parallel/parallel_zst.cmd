#!/bin/csh

ls 200908010*.zst | parallel -I% --max-args 1  -j 6   'zstd -d -c -q $1 > /dev/null'

