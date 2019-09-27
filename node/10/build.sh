clear
##-------------- RELEASE

export NODE_VERSION="10"
export SONAR_SCANNER_NPM_VERSION="2.5.0" 
export SONAR_SCANNER_CLI_VERSION="4.0.0.1744"

docker-compose -f ../docker-compose.build.yml build
docker-compose -f ../docker-compose.build.yml push