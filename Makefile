inspect:
	packer inspect ubuntu-18.04-docker-traefik.json

validate:
	packer validate ubuntu-18.04-docker-traefik.json

build :
	packer build ubuntu-18.04-docker-traefik.json

debug:
	packer build -debug ubuntu-18.04-docker-traefik.json
