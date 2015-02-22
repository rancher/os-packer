#Packer build

* Get ahold of Rancheros.iso
* Put it in this projects root directory
* Run:

```
packer build rancheros-config.json

vagrant box add --name rancheros ./rancheros*.box # This is the box that was just built.

```

get the [Vagrantfile](https://github.com/cloudnautique/rancher-vagrant)

vagrant up