#рпозиторий:
git clone https://github.com/vegasbrianc/prometheus.git

#установка
docker stack deploy -c docker-stack.yml prom

#Просмотр запущенных сервисов:
docker service ls
