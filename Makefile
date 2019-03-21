install:
	ansible-galaxy install -r ansible/requirements.yml

inspect:
	packer inspect images/ubuntu/base.json

validate:
	packer validate images/ubuntu/base.json

build:
	packer build images/ubuntu/base.json
