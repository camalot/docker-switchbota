FROM node:current-alpine

RUN \
	apk update && \
	apk add --update git curl build-base && \
	mkdir -p /app && \
	mkdir -p /tmp/switchbota && \
	git clone --single-branch --branch main https://github.com/kendallgoto/switchbota.git /tmp/switchbota && \
	mv /tmp/switchbota/server/* /app/ && \
	apk del git build-base && \
	rm -rf /var/cache/apk/* && \
	rm -rf /tmp/switchbota && \
	cd /app && \
	npm install

WORKDIR /app

ENTRYPOINT [ "node" "index.js" ]
