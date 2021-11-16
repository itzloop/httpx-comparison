STATIC_SOURCE=/home/loop/uni/neteng/httpx/static
STATIC_TARGET=/usr/share/nginx/html
CONFIG_SOURCE=/home/loop/uni/neteng/httpx/config
CONFIG_TARGET=/etc/nginx/conf.d
CERT_SOURCE=/home/loop/uni/neteng/httpx/cert
CERT_TARGET=/usr/local/nginx/cert
PORT_MAPPING=4433:443

run1:
	docker run \
		--mount type=bind,source=$(STATIC_SOURCE)/q1,target=$(STATIC_TARGET),readonly \
		--mount type=bind,source=$(CONFIG_SOURCE)/q1,target=$(CONFIG_TARGET),readonly \
		--mount type=bind,source=$(CERT_SOURCE),target=$(CERT_TARGET),readonly \
		-p $(PORT_MAPPING) nginx

run2:
	docker run \
		--mount type=bind,source=$(STATIC_SOURCE)/q2,target=$(STATIC_TARGET),readonly \
		--mount type=bind,source=$(CONFIG_SOURCE)/q2,target=$(CONFIG_TARGET),readonly \
		--mount type=bind,source=$(CERT_SOURCE),target=$(CERT_TARGET),readonly \
		-p $(PORT_MAPPING) nginx

run3:
	docker run \
		--mount type=bind,source=$(STATIC_SOURCE)/q3,target=$(STATIC_TARGET),readonly \
		--mount type=bind,source=$(CONFIG_SOURCE)/q3,target=$(CONFIG_TARGET),readonly \
		--mount type=bind,source=$(CERT_SOURCE),target=$(CERT_TARGET),readonly \
		-p $(PORT_MAPPING) nginx
