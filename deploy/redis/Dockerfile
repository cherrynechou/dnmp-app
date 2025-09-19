# 指定基于 redis:latest 创建
FROM redis:latest

#维护者信息
MAINTAINER cherrynechou iboy_2008@163.com

ARG TZ

# 修改时间
RUN if [ ${TZ} ]; then apk add --no-cache --virtual .fetch-deps tzdata && cp -r "/usr/share/zoneinfo/${TZ}" /etc/localtime && echo "${TZ}" > /etc/timezone && apk del .fetch-deps; fi


CMD [ "redis-server", "/etc/redis/docker.conf" ]