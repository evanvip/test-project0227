#!/bin/bash

# 项目名称
PROJECT="test-project0227"
IMAGE="my-web"
CONTAINER="web-server"
PORT=8080

echo "开始部署 $PROJECT ..."

# 拉取最新代码
cd /opt/$PROJECT || (git clone https://github.com/evanvip/$PROJECT.git /opt/$PROJECT && cd /opt/$PROJECT)

# 停止并删除旧容器
docker stop $CONTAINER 2>/dev/null
docker rm $CONTAINER 2>/dev/null

# 构建新镜像
docker build -t $IMAGE /opt/$PROJECT.

# 启动新容器
docker run -d --name $CONTAINER -p $PORT:80 $IMAGE

echo "部署完成！访问 http://你的服务器IP:$PORT"