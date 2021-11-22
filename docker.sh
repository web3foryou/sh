#смотрим список запущенных контейнеров
docker ps

#загрузка образа
docker pull

#собирает образ
docker build

#смотрим логи
docker logs

#запускаем контейнер
docker run

#останавливает контейнер
docker stop

#«убивает» контейнер
docker kill

#удаляет контейнер
docker rm

#удаляет образ
docker rmi

#Если нужно будет пересобрать все сервисы, то можно запустить ту же команду без указания сервиса:
docker-compose up -d --no-deps --build

# остановить все контейнеры
docker-compose stop
