install:
	ansible-galaxy install -r ansible/requirements.yml

inspect:
	packer inspect images/ubuntu/base.json

validate:
	packer validate -var-file variables.json images/ubuntu/base.json

build:
	packer build -var-file variables.json images/ubuntu/base.json
