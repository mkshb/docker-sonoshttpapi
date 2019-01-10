# mkshb.de - Dockerfile to publish Node-Sonos-HTTP-API

FROM node:11-alpine

WORKDIR /app

RUN	apk	--no-cache add curl && \
	curl -L https://github.com/jishi/node-sonos-http-api/archive/master.tar.gz --output master.tar.gz && \
	tar xvzf master.tar.gz --strip=1 -C /app && \
	mkdir cache && \
	ln -s settings/settings.json && \
	chown -R node:node static cache && \
	npm install --production

EXPOSE 5005

USER node

HEALTHCHECK --interval=1m --timeout=2s CMD curl -LSs http://localhost:5005 || exit 1

CMD npm start
