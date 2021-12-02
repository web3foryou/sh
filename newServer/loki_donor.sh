#!/bin/bash
apt -s install git
apt -s install docker-compose

cd /home/
git clone https://github.com/web3foryou/loki-node.git

cd /home/loki-node/

docker-compose pull
docker-compose up -d --no-deps --build

#удаление
#docker-compose ps

#docker-compose stop
#docker-compose rm

#релоад:
#git pull
#docker-compose down
#docker-compose pull
#docker-compose up -d --no-deps --build

#вывод коносли в файл:
#df -h >> /var/log/node/error.log
#massa_wallet_info>&1 >> error.log
#massa_wallet_info >> error.log
#sh log.sh >> error.log
#cd /$HOME/massa/massa-client/ ./massa-client wallet_info >> /var/log/node/error.log
#cd /$HOME/massa/massa-client/ ./massa-client wallet_info | find "LOG"