inspect:
	packer inspect ubuntu-18.04-docker.json

validate:
	packer validate \
	  -var-file variables.json \
	  ubuntu-18.04-docker.json

build :
	packer build \
		-var-file variables.json \
		ubuntu-18.04-docker.json
