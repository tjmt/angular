clear
##-------------- RELEASE

export NGINX_VERSION="1.17.4"
export TIMEZONE="America/Cuiaba"
export LANGUAGE="pt_BR"
export UNICODE="UTF-8"

docker-compose -f ../docker-compose.build.yml build
docker-compose -f ../docker-compose.build.yml push