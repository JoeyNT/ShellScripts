#!/bin/bash

#Author: JoeyNT
#Date: 04/19/19
#This shell script compares different compression methods outputting the best one

cp $1 "$1.orig" 
zip -r "$1" $1 &> /dev/null

cp $1 > junk &> /dev/null

gzip junk &> /dev/null

cp $1 > junk &> /dev/null

compress $1 &> /dev/null

bzip2 junk &> /dev/null

cksum *.bz2 *.gz *.Z *.zip > file.ret

rm *.Z *.gz *.zip *.bz2

ANSWB=$(sort -t " " -k2 -n file.ret | head -n 1 | cut -d " " -f3,3)
WANSW=$(sort -t " " -k2 -nr file.ret | head -n 1 | cut -d " " -f3,3)
rm file.ret

if [[ $ANSWB == *.bz2 ]]; then
        echo "The BEST compressor is bzip2"
elif [[ $ANSWB == *.gz ]]; then 
        echo "the BEST compressor is gzip"
elif [[ $ANSWB == *.Z ]]; then 
        echo "The BEST compressor is compress"
elif [[ $ANSWB == *.zip ]]; then 
        echo "The BEST compressor is zip"
fi

if [[ $WANSW == *.bz2 ]]; then
        echo "The WORST compressor is bzip2"
elif [[ $WANSW == *.gz ]]; then
        echo "the WORST compressor is gzip"
elif [[ $WANSW == *.Z ]]; then
        echo "The WORST compressor is compress"
elif [[ $WANSW == *.zip ]]; then
        echo "The WORST compressor is zip"
fi
exit
