# Introduction to Packer Build Scripts in AWS China
---

## Make packer-based AMI
We only need to run make build script for once and set the AMI's id to `source_ami` parameter in `./amazon/rancheros-cn-aws-ami-amis.json`

Please run `RANCHEROS_VERSION=vX.Y.Z make build-aws-cn-builder-image` to publish packer-based AMI to AWS China.

## Make RancherOS AMI
Once you have pushed the rancher/os:vX.Y.Z image to the hub.

Then run `RANCHEROS_VERSION=vX.Y.Z make build-aws-cn` to publish RancherOS AMI to AWS China.

## Public AMI
Please run `RANCHEROS_VERSION=vX.Y.Z make set-amis-public-cn` to publish RancherOS AMI to public.
