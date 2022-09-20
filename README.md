# DOCKER-SWITCHBOTA-SERVER

A docker image for the [switchbota-server](https://github.com/kendallgoto/switchbota/tree/main/server).

Just mean to be a simple container to run the switchbota-server

# RUNNING

There are 2 docker compose files. One uses host networking, with port `80` exposed. 

The other uses `2180` and is meant to be used in conjunction with nginx (or some other reverse proxy). 
See [How to configure a docker nginx reverse proxy](https://www.theserverside.com/blog/Coffee-Talk-Java-News-Stories-and-Opinions/Docker-Nginx-reverse-proxy-setup-example) for help and example on how to do this.
## SAMPLE NGINX CONFIG
```
upstream switchbota_app {
	server 192.168.1.123:2180;
}

server {
	listen 80 default_server;
	server_name _;

	location / {
		resolver 192.168.1.3;

		proxy_set_header Host $host;
		proxy_set_header X-Real-IP $remote_addr;
		proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;

		proxy_pass http://switchbota_app;
	}
}
```
