# 指定基于 nginx:latest 创建
FROM nginx:alpine

#维护者信息
MAINTAINER cherrynechou iboy_2008@163.com

ARG TZ

# 修改时间
RUN if [ ${TZ} ]; then apk add --no-cache --virtual .fetch-deps tzdata && cp -r "/usr/share/zoneinfo/${TZ}" /etc/localtime && echo "${TZ}" > /etc/timezone && apk del .fetch-deps; fi


# 创建配置文件和日志目录
RUN mkdir -p /var/www/html

#容器启动时执行指令
CMD ["nginx", "-g", "daemon off;"]
