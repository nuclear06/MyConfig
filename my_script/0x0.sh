#! /usr/bin/env bash

# This script will upload file to https://0x0.st
# set -xe

file="$1"
if [ ! -f "$file" ]; then
    echo "File not found: $file"
    exit 1
fi

size=$(du -m "$file" | cut -f1)

if [ $size -gt 512 ]; then
    echo "File size is greater than 512MB"
    exit 1
fi

expire="$2"
check_expire_time() {
    # parse time string
    tmp=$(date -d "$1" 2>/dev/null)
    if [ -n "$tmp" ]; then
        echo "file will expire at $1"
        expire=$tmp
        return 0
    fi
    # parse timestamp
    tmp=$(date -d @$1 2>/dev/null)
    if [ -n "$tmp" ]; then
        echo "file will expire at $tmp"
        expire=$tmp
        return 0
    fi
    # keeping hours
    tmp=$(date -d "now + $1 hours" 2>/dev/null)
    if [ -n "$tmp" ]; then
        echo "file will expire at $tmp"
        expire=$tmp
        return 0
    fi
    return 1
}

if [ -z "$expire" ]; then
    curl -# -F "file=@$file" https://0x0.st
else
    if ! check_expire_time "$expire"; then
        echo "Invalid expire time: $expire"
        exit 1
    fi
    curl -# -F "file=@$file" -F "expire=$expire" https://0x0.st
fi

