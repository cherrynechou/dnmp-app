FROM mysql:8.4

#维护者信息
MAINTAINER cherrynechou iboy_2008@163.com

ARG TZ

# 修改时间
RUN ln -snf "/usr/share/zoneinfo/${TZ}" /etc/localtime && echo "{$TZ}" > /etc/timezone

# 创建配置文件和日志目录
RUN mkdir -p /var/log/mysql/

#文件及权限 \
RUN chown -R mysql:mysql /var/lib/mysql/ && chown -R mysql:mysql /var/run/mysqld/ && chown -R mysql:mysql /var/log/mysql/ && \
    chmod -R 644 /var/lib/mysql/ &&  chmod -R 644 /var/run/mysqld/ && chmod -R 644 /var/log/mysql/

CMD ["mysqld"]

