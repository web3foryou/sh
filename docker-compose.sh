#сборка проекта
docker-compose build

#запуск проекта
docker-compose up

#останавливает кнтейнер
docker-compose down

#Если нужно будет пересобрать все сервисы, то можно запустить ту же команду без указания сервиса:
docker-compose up -d --no-deps --build

# остановить все контейнеры
docker-compose stop

#журнал сервисов
docker-compose logs -f [service name]

#список контейнеров
docker-compose ps

#выполнить команду в выполняющемся контейнере
docker-compose exec [service name] [command]

#вывести список образов
docker-compose images

#вывести список образов
docker-compose rm