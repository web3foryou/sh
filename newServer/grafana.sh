#рпозиторий:
git clone https://github.com/vegasbrianc/prometheus.git

#установка
docker stack deploy -c docker-stack.yml prom

#Просмотр запущенных сервисов:
docker service ls

# настройка графаны + прометеус
# конфиг: /home/prometheus/prometheus/prometheus.yml

#ПЕРЕУСТАНОВКА:
#cd /home/prometheus
#docker service ls
#docker stack deploy -c docker-stack.yml prom
#docker service ls
#docker stack deploy -c docker-stack.yml prom
#docker service ls
