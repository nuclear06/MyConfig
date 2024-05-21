#!/bin/bash
if [ $# -lt 1 ]; then
    echo "Usage: ln2bin <file> [name]"
    exit 1
fi

if [ -f "$1" ]; then
    name=${2:-$(basename "$1")}
    if [[ $name == *.* ]]; then
        name=${name%.*}
    fi

    if [ -z "$name" ]; then
        echo unexpected error: name is empty
        exit 1
    fi
    sudo ln -s -f "$PWD"/"$1" /usr/local/bin/"$name"
    if [ $? -eq 0 ]; then
        echo "[/usr/local/bin/$name]->[$1]"
    else
        echo "link failed, maybe you need sudo"
    fi
else
    echo "File does not exist"
fi
