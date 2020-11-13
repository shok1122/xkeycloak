docker-compose run --rm -d gw01db
docker-compose run --rm gw01 kong migrations bootstrap

docker-compose stop gw01db gw01
