install:
	ansible-galaxy install kadenlnelson.ansible_role_ubuntu_base
	ansible-galaxy install kadenlnelson.ansible_role_docker_traefik

inspect:
	packer inspect images/ubuntu/base.json

validate:
	packer validate images/ubuntu/base.json

build:
	packer build images/ubuntu/base.json
