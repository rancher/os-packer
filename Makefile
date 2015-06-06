ifneq ("$(wildcard authorized_key)","")
	FILE_EXISTS := 1
else
	FILE_EXISTS := $(shell while [ -z "$$SSH_AUTHORIZED_KEY" ]; do read -r -p "NOTE: you can \`cp authorized_key.vagrant authorized_key\` to use the default vagrant insecure public key!  Enter the authorized key you wish to associate with this rancher OS [SSH_AUTHORIZED_KEY]: " SSH_AUTHORIZED_KEY; echo "export SSH_AUTHORIZED_KEY=$$SSH_AUTHORIZED_KEY">>authorized_key; cat authorized_key; done ;);
endif
ifneq ("$(wildcard atlas_cloud_token)","")
	FILE_EXISTS := 1
else
	FILE_EXISTS := $(shell while [ -z "$$ATLAS_CLOUD_TOKEN" ]; do read -r -p "Enter the atlas cloud token you wish to associate with this rancher OS [ATLAS_CLOUD_TOKEN]: " ATLAS_CLOUD_TOKEN; echo "export ATLAS_CLOUD_TOKEN=$$ATLAS_CLOUD_TOKEN">>atlas_cloud_token; cat atlas_cloud_token; done ;);
endif
include authorized_key
include atlas_cloud_token
include gce_account
include env_vars

PACKER_JSON := rancheros-packer.json
PACKER_JSON_TEST := rancheros-packer-test.json
TIME := /usr/bin/time -v
NICE := nice ionice -c3
CMD_PRE := $(TIME) $(NICE)

all: help

help:
	@echo ""
	@echo "-- Help Menu"
	@echo ""
	@echo "first create the authorized_key file, you can \`cp authorized_key.vagrant authorized_key\` to use the vagrant public key"
	@echo ""
	@echo "   1. make vagrant       - build the vagrant packer image"
	@echo "   1. make vbox       - build the virtualbox-iso packer image without vagrant post processor"
	@echo "   1. make qemu       - build the qemu packer image"
	@echo "   2. make clean  - cleanup"

qemu:
	@echo "qemu"
	@echo "$(CMD_PRE) packer build --only=qemu $(PACKER_JSON)" |bash

qemu-debug:
	@echo "qemu debug"
	@echo "$(CMD_PRE) packer build -debug --only=qemu $(PACKER_JSON_TEST)" |bash

vagrant:
	@echo "vbox"
	@echo "$(CMD_PRE) packer build --only=vagrant $(PACKER_JSON)" |bash

vagrant-cloud:
	@echo "vbox"
	@echo "$(CMD_PRE) packer build --only=vagrant-cloud $(PACKER_JSON)" |bash

vbox:
	@echo "vbox"
	@echo "$(CMD_PRE) packer build --only=virtualbox-iso $(PACKER_JSON)" |bash

vbox-debug:
	@echo "vbox debug"
	@echo "$(CMD_PRE) packer build -debug --only=virtualbox-iso $(PACKER_JSON_TEST)" |bash

clean: cleanbuilds

cleanbuilds:
	@echo "cleaning Builds"
	rm -Rf output
	rm -Rf output-qemu

beep:
	@echo "beep"
	@aplay /usr/share/sounds/alsa/Front_Center.wav

build: qemu beep

envtest:
	@echo "$(CMD_PRE)"
	@echo "$(SSH_AUTHORIZED_KEY)"
	@echo "$(RANCHEROS_VERSION)"
	@echo "$(VAGRANT_RELEASE)"
	@echo "$(PACKER_JSON)"
