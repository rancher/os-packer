# Introduction to Packer Build Scripts in Azure
---
## Make azure vhd
Please run `PACKER_BOOT_WAIT=100s RANCHEROS_VERSION=vX.Y.Z make build-azure` to build azure vhd.

## Upload vhd and Startup a vm for Azure stack validation
Please run `./scripts/azure/pre-release-azure-img.sh` to upload azure vhd and boot a vm for azure stack validation.

```
AZURE_REGION="westus" AZURE_ROS_SSH_PUBLIC_KEY=$(cat ~/.ssh/id_rsa.pub) ./scripts/azure/pre-release-azure-img
```

## Notice
You need to certify your VM, and get the sas uri before shipping the image to marketplace.
Before certifying your VM, You need to copy `waagent.conf` from the `waagent` container to `/etc/waagent.conf` in console.

More references:
- https://docs.microsoft.com/zh-cn/azure/marketplace/cloud-partner-portal/virtual-machine/cpp-certify-vm
- https://docs.microsoft.com/zh-cn/azure/marketplace/cloud-partner-portal/virtual-machine/cpp-get-sas-uri
