#!/usr/bin/env bash

set -eu

# 默认设置为使用 IPv4
protocol="-4"

# 使用 getopts 解析命令行选项
while getopts "46" opt; do
  case "$opt" in
  4) protocol="-4" ;;
  6) protocol="-6" ;;
  ?)
    echo "Invalid option: -$OPTARG" >&2
    exit 1
    ;;
  esac
done

# 移除已经处理的选项，剩下的是额外的参数
shift $((OPTIND - 1))

# 检查是否有剩余的参数（即 IP 地址）
if [[ -z "${1:-}" ]]; then
  # 如果没有额外的参数，使用指定的协议查询本机 IP
  curl $protocol ping0.cc/geo
else
  # 如果有额外的参数，认为是 IP 地址，进行查询
  curl -s "https://api.iplocation.net/?ip=$1" | jq
fi
