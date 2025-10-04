# 指定基于 redis:latest 创建
FROM redis:latest

#维护者信息
MAINTAINER cherrynechou iboy_2008@163.com

ARG TZ

# 修改时间
RUN ln -snf "/usr/share/zoneinfo/${TZ}" /etc/localtime && echo "{$TZ}" > /etc/timezone

CMD [ "redis-server", "/etc/redis/docker.conf" ]