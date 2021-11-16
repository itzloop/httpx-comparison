STATIC_SOURCE=/home/loop/uni/neteng/httpx/static
STATIC_TARGET=/usr/share/nginx/html
CONFIG_SOURCE=/home/loop/uni/neteng/httpx/config
CONFIG_TARGET=/etc/nginx/conf.d

run:
	docker run \
		--mount type=bind,source=$(STATIC_SOURCE),target=$(STATIC_TARGET),readonly \
		--mount type=bind,source=$(CONFIG_SOURCE),target=$(CONFIG_TARGET),readonly \
		-p 8080:80 nginx

# run the container in detached mode
rund:
	docker run \
		--mount type=bind,source=$(STATIC_SOURCE),target=$(STATIC_TARGET),readonly \
		--mount type=bind,source=$(CONFIG_SOURCE),target=$(CONFIG_TARGET),readonly \
		-dp 8080:80 nginx
