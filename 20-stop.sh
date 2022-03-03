#!/bin/sh

pushd ./nginx-certbot
docker-compose down
popd

pushd ./bosmer
docker-compose down
popd

