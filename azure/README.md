# Introduction to Packer Build Scripts in Azure
---
## Make azure vhd
Please run `PACKER_BOOT_WAIT=100s make build-azure` to build azure vhd.

## Upload vhd and Startup a vm for Azure stack validation
Please run `./scripts/azure/pre-release-azure-img.sh` to upload azure vhd and startup a vm for azure stack validation.

## Notice
Before release this vhd to azure image marketplace, user need manual verification the vm created by vhd(vhd images).
Before execute validation process, user need copy `waagent.conf` from `waagent` system docker container to consoles' `/etc/waagent.conf`. 