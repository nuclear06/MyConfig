#!/bin/bash

dev_names=(
    "AT Translated Set 2 keyboard"
    "ELAN2841:00 04F3:31AD Touchpad"
)
dev_ids=()

# Get device IDs
for dev_name in "${dev_names[@]}"; do
    dev_id=$(xinput list | grep "${dev_name}" | awk -F'=' '{print $2}' | awk '{print $1}')
    if [ -z "$dev_id" ]; then
        echo "Device not found: ${dev_name}"
        exit 1
    fi
    dev_ids+=("$dev_id")
done

get_device_status() {
    for dev_id in "${dev_ids[@]}"; do
        dev_status=$(xinput list-props "${dev_id}" | grep "Device Enabled" | awk '{print $4}')
        if [ $? -ne 0 ]; then
            echo "Device not found!"
            exit 1
        fi
        if [ "$dev_status" == "0" ]; then
            echo "device[${dev_id}]: Disabled"
        else
            echo "device[${dev_id}]: Enabled"
        fi
    done
}

toggle_device_status() {
    for dev_id in "${dev_ids[@]}"; do
        dev_status=$(xinput list-props "${dev_id}" | grep "Device Enabled" | awk '{print $4}')
        if [ $? -ne 0 ]; then
            echo "Device not found!"
            exit 1
        fi
        if [ "$dev_status" == "0" ]; then
            xinput enable "$dev_id" &&
            echo "Enabled device ${dev_id}"
        else
            xinput disable "$dev_id" &&
            echo "Disabled device ${dev_id}"
        fi
    done
}

if [ "$1" == "show" ]; then
    get_device_status
else
    toggle_device_status
fi
