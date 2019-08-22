# docker-sonoshttpapi
Docker Image for Node-Sonos-HTTP-API https://github.com/jishi/node-sonos-http-api

## Docker Hub
https://hub.docker.com/r/mkshb/sonoshttpapi

Image is available for arm and amd64

## Install Docker Image
docker pull mkshb/sonoshttpapi

## Add directories and files

> sudo mkdir /opt/sonoshttpapi && \
sudo chown pi:pi /opt/sonoshttpapi && \
cd /opt/sonoshttpapi && \
mkdir clips && \
mkdir settings && \
mkdir cache && \
mkdir presets && \
curl https://raw.githubusercontent.com/jishi/node-sonos-http-api/master/presets/example.json > presets/example.json && \
echo {} > settings/settings.json

## Run Docker Container
> docker run \
  --net=host \
  --name sonoshttpapi \
  --restart=always \
  -d \
  -v `pwd`/settings:/app/settings \
  -v `pwd`/clips:/app/static/clips \
  -v `pwd`/cache:/app/cache \
  -v `pwd`/presets:/app/presets \
  mkshb/sonoshttpapi

## docker-compose file
version: '3.1'

services:

  sonosapi:
    image: mkshb/sonoshttpapi:amd64-1.6.9
    restart: always
    volumes:
      - ./settings:/app/settings
      - ./clips:/app/static/clips
      - ./cache:/app/cache
      - ./presets:/app/presets
    network_mode: "host"
