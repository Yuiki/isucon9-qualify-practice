#!/bin/sh
sudo truncate -s 0 -c /var/log/nginx/access.log
sudo truncate -s 0 -c /var/log/mysql/mysql-slow.log
cd ~/isucari
./bin/benchmarker -target-url http://127.0.0.1:80
sudo alp ltsv --file=/var/log/nginx/access.log -r --sort=sum -m "/items/[0-9]+.json, /upload/[0-9a-z]+.jpg, /users/[0-9]+.json, /new_items/[0-9]+.json, /transactions/[0-9]+.png"
