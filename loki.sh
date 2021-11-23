#!/bin/bash
apt -s install git
apt -s install docker-compose

git clone https://github.com/grafana/loki.git

cd /home/loki/production/

docker-compose pull
docker-compose up