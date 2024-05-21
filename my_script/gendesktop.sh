#!/bin/bash

# 检查是否提供了至少一个参数（可执行文件的名字）
if [ $# -lt 1 ]; then
  echo "Usage: $0 executable_name [-n name] [-i icon_path]"
  exit 1
fi

# 默认参数
executable_name=$1
desktop_name=""
icon_path=""

# 如果文件名中包含后缀，去掉后缀
base_name=$(basename "$executable_name")
if [[ $base_name == *.* ]]; then
  base_name="${base_name%.*}"
fi

# 解析命令行参数
shift
while getopts 'n:i:' flag; do
  case "${flag}" in
  n) desktop_name="${OPTARG}" ;;
  i) icon_path="${OPTARG}" ;;
  *) error "Unexpected option ${flag}" ;;
  esac
done

# 如果没有提供desktop文件的名字，则使用无后缀的可执行文件的名字
if [ -z "$desktop_name" ]; then
  desktop_name=$base_name
fi

# 检查icon文件
if [ -z "$icon_path" ]; then
  # 尝试查找同名的图片文件
  for ext in .svg .png .jpeg .jpg; do
    if [ -f "${base_name}${ext}" ]; then
      icon_path="${PWD}/${base_name}${ext}"
      break
    fi
  done
else
  icon_path="${PWD}/${icon_path}"
  # 如果提供了icon文件，检查文件是否存在
  if [ ! -f "$icon_path" ]; then
    echo "Icon file does not exist: $icon_path"
    exit 1
  fi
fi

# 生成.desktop文件
cat >"${PWD}/${desktop_name}.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=${desktop_name}
Exec=${PWD}/${executable_name}
Icon=${icon_path}
Terminal=false
EOF

echo "${desktop_name}.desktop has been created."
