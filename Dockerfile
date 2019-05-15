FROM node:alpine
MAINTAINER luohaoyu0920@foxmail.com
ENV TZ = Asia/Shanghai

#将代码移动到容器中的 /ndoe 路径下
COPY . /node

#指定工作目录
WORKDIR /node

#安装PM2
RUN npm install -g pm2@latest

#指定时区
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

#暴露容器的3000端口
EXPOSE 3000

#启动服务
CMD ["pm2", "start", "./bin/www","--no-daemon"]
