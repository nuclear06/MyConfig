#! /usr/bin/env bash

# set -x
arg=$1

if [ -n $arg ]; then
    res=`fdfind "$1" -tl -tx --search-path=/usr/bin --search-path=/usr/local/bin --search-path=/usr/sbin --search-path=/usr/local/sbin -x echo -e "{/.}" | uniq`
    line=$(echo "$res" | wc -l)
    echo $res
    echo "[Total: $line]"
fi
