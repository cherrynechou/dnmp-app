# 指定基于 php:8.2-fpm 创建
FROM php:8.2-fpm

#维护者信息
MAINTAINER  cherrynechou iboy_2008@163.com
ARG TZ

# 修改时间
RUN ln -snf "/usr/share/zoneinfo/${TZ}" /etc/localtime && echo "{$TZ}" > /etc/timezone

# 安装系统依赖
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libssl-dev \
    libcurl4-openssl-dev \
    libicu-dev \
    libevent-dev \
    libxslt1-dev \
    unzip \
    zip \
    supervisor \
    && rm -rf /var/lib/apt/lists/*


# 配置 GD 库（支持 JPEG、PNG、FreeType）
RUN docker-php-ext-configure gd --with-freetype --with-jpeg

# 安装 PHP 扩展
RUN docker-php-ext-install \
    gd \
    pdo \
    pdo_mysql \
    mysqli \
    bcmath \
    dom \
    zip \
    ftp \
    calendar \
    mbstring \
    exif \
    pcntl \
    intl \
    xsl \
    sockets

# 安装 Redis 扩展
RUN pecl install redis \
	&& pecl install event \
    && docker-php-ext-install opcache \
    && docker-php-ext-enable redis \
    && docker-php-ext-enable event

#5 Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

#使event扩展使能
RUN  mv /usr/local/etc/php/conf.d/docker-php-ext-event.ini /usr/local/etc/php/conf.d/z000-docker-php-ext-event.ini


#6.清理
RUN rm -rf /var/cache/apt/*


# 设置工作目录
WORKDIR /var/www/html

# 设置目录权限
RUN chown -R www-data:www-data /var/www/html


# 设置容器启动时执行的命令（可选）
# 启动 supervisord，管理 php-fpm 和 nginx
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]

