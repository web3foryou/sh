#!/bin/bash
#MAIN NODE
git clone https://github.com/grafana/loki.git

cd /home/loki/production/

docker-compose pull
docker-compose up -d --no-deps --build
