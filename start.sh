#!/bin/bash

# 定义下载路径
DIR="/docker/feiyangdigitalbotconf"

# 定义要下载的文件的URL
URLS=(
    "https://hub.docker.com/r/youshandefeiyang/feiyangdigital-bot/main/config/bot.sql"
    "https://hub.docker.com/r/youshandefeiyang/feiyangdigital-bot/main/config/config.json"
    "https://hub.docker.com/r/youshandefeiyang/feiyangdigital-bot/main/docker-compose.yml"
)

# 检查目录是否存在，如果存在则删除并重新创建
if [ -d "$DIR" ]; then
    rm -rf "$DIR"
fi
mkdir -p "$DIR"

# 使用curl下载文件
for url in "${URLS[@]}"; do
    filename=$(basename "$url")
    if ! curl -o "$DIR/$filename" "$url"; then
        echo -e "\e[31m网络错误：无法从$url下载文件\e[0m" # 使用红色字体显示错误信息
        exit 1
    fi
done

# 所有文件下载完成后的提示
echo -e "\e[31m请在/docker/feiyangdigitalbotconf/config.json中填写你的bot配置信息\e[0m" # 使用红色字体显示提示信息
