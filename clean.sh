#!/bin/bash

# 获取当前目录
current_dir=$(pwd)

# 遍历当前目录下的所有一级目录
for dir in "$current_dir"/*/; do
    # 进入目录
    cd "$dir" || continue
    echo "Entering directory: $dir"

    # 执行 flutter clean
    flutter clean

    # 返回到原始目录
    cd "$current_dir" || exit
done