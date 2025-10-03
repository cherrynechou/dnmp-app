#!/bin/sh


chmod 755 ../data/mysql
chmod 777 ../data/redis

chmod 777 ../run/redis
chmod 777 ../logs/redis

chmod 777 -R ../servers/supervisor

chmod 777 -R ../servers/nginx
chmod 777 -R ../logs/nginx
