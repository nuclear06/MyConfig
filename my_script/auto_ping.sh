#!/bin/bash
IPs=(192.168.31.70 192.168.31.120)

for ip in ${IPs[*]}; do
    echo $ip
    ping -c 5 $ip &>/dev/null
done
echo finish
