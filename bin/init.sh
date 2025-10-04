#!/bin/sh
chmod 755 -R ../data/mysql

chmod 777 -R ../deploy/redis
chmod 777 -R ../data/redis
chmod 777 -R ../run/redis
chmod 777 -R ../logs/redis

chmod 777 -R ../servers/supervisor

chmod 777 -R ../servers/nginx
chmod 777 -R ../logs/nginx