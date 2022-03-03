#!/bin/sh

. ./env.sh

pushd ./bosmer

# backend
cp ../bosmer-config/backend/.dockerignore ./backend/.dockerignore
cp ../bosmer-config/backend/Dockerfile ./backend/Dockerfile

# frontend
cp ../bosmer-config/frontend/.dockerignore ./frontend/.dockerignore
sed -e "/VITE_PROD_URL/ s!<++>!${VITE_PROD_URL}!" \
    ../bosmer-config/frontend/Dockerfile > ./frontend/Dockerfile

cp ../bosmer-config/frontend/default.conf ./frontend/default.conf

# root
cp ../bosmer-config/docker-compose.yml ./docker-compose.yml

docker-compose up $@ -d

popd
pushd ./nginx-certbot

cp ../nginx-certbot-config/default.conf ./nginx-template/default.conf
cp ../nginx-certbot-config/docker-compose.yml ./docker-compose.yml

./10-proxy.sh -d

