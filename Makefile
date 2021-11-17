WD=$(shell pwd)

STATIC_SOURCE=$(WD)/static
STATIC_TARGET=/usr/share/nginx/html
CONFIG_SOURCE=$(WD)/config
CONFIG_TARGET=/etc/nginx/conf.d
CERT_SOURCE=$(WD)/cert
CERT_TARGET=/usr/local/nginx/cert

_PORT=4433
ifneq (,$(PORT))
	_PORT=$(PORT)
endif

_Q=q1
ifneq (,$(Q))
	_Q=$(Q)
endif

run:
	docker run \
		--mount type=bind,source=$(STATIC_SOURCE)/$(_Q),target=$(STATIC_TARGET),readonly \
		--mount type=bind,source=$(CONFIG_SOURCE)/$(_Q),target=$(CONFIG_TARGET),readonly \
		--mount type=bind,source=$(CERT_SOURCE),target=$(CERT_TARGET),readonly \
		-p $(_PORT):443 nginx

cert:
	mkdir -p $(CERT_SOURCE)
	sudo openssl req -x509 -sha256 -newkey rsa:2048 -keyout $(CERT_SOURCE)/cert.key -out $(CERT_SOURCE)/cert.pem -days 1024 -nodes

doc:
	pandoc -f markdown-implicit_figures \
		-f gfm --highlight-style=breezedark \
		-o document.pdf README.md

help:
	@echo to create a certificate run make cert
	@echo to create a pdf document out of markdown run make doc
	@echo Q=1 PORT=2 make run
	@echo 1 should be q1, q2 or q3
	@echo 2 is host_port
	@echo examples:
	@echo Q=2 make run
	@echo Q=2 PORT=443 make run
