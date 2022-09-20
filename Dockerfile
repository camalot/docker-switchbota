FROM node:current-alpine

RUN \
	apk update && \
	apk add --update git curl build-base && \
	mkdir -p /app && \
	git clone --single-branch --branch main https://github.com/kendallgoto/switchbota.git /tmp && \
	mv /tmp/switchbota/server/* /app/ \
	apk del git build-base && \
	rm -rf /var/cache/apk/* \
	cd /app \
	npm install

WORKDIR /app

ENTRYPOINT [ "node" "index.js" ]
