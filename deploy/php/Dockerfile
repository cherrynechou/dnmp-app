# 指定基于 php:8.2-fpm-alpine 创建
FROM php:8.2-fpm-alpine

#维护者信息
MAINTAINER  cherrynechou iboy_2008@163.com

ARG TZ

# 修改时间
RUN if [ ${TZ} ]; then apk add --no-cache --virtual .fetch-deps tzdata && cp -r "/usr/share/zoneinfo/${TZ}" /etc/localtime && echo "${TZ}" > /etc/timezone && apk del .fetch-deps; fi

RUN mkdir -p /etc/supervisor.d

# Install build dependencies and runtime dependencies
RUN apk update && \
    apk add --no-cache --virtual .build-deps \
    autoconf \
    gcc \
    g++ \
    make \
    libtool \
    linux-headers \
    && apk add --no-cache \
    # Runtime dependencies \
    icu \
    icu-data-full\
    imagemagick-dev \
    imagemagick-svg \
    libzip-dev \
    oniguruma-dev \
    libpng-dev \
    libavif-dev \
    libjpeg-turbo-dev \
    libwebp-dev \
    libxpm-dev \
    libxml2 \
    libxml2-dev \
    freetype-dev \
    libpng-dev \
    libavif-dev \
    libxslt-dev \
    icu-dev \
    gmp-dev \
    gettext-dev \
    libjpeg-turbo-dev \
    freetype-dev \
    libzip \
    libpng \
    libavif \
    libjpeg-turbo \
    freetype \
    # Event 扩展依赖
    libevent-dev \
    openssl-dev \
    supervisor

# 2. 配置并安装核心扩展 (例如gd需要先配置)
RUN docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp --with-xpm  \
    && docker-php-ext-configure zip \
    && docker-php-ext-install \
    gd \
    pdo \
    pdo_mysql \
    mysqli \
    opcache \
    bcmath \
    dom \
    zip \
    ftp \
    calendar \
    gettext \
    shmop \
    pcntl \
    intl \
    xsl \
    sockets

#3. redis event扩展安装
RUN pecl install redis \
    && pecl install event \
    && docker-php-ext-enable redis \
    && docker-php-ext-enable event

#5 Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

#使event扩展使能
RUN  mv /usr/local/etc/php/conf.d/docker-php-ext-event.ini /usr/local/etc/php/conf.d/z999-docker-php-ext-event.ini

#6.清理
RUN apk del .build-deps \
    && rm -rf /var/cache/apk/*


# 设置容器启动时执行的命令（可选）
# 启动 supervisord，管理 php-fpm 和 nginx
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]