# RancherOS vSphere Build

These builds do not supply a `cloud-config.yml` file. This is expected to be included when deploying the template in vSphere via the `guestinfo` fields.

## Example Build without Uploading to vSphere

This build will create the VM and store it in the `output-rancheros-1.4.3` directory.

```
export RANCHEROS_VERSION=1.4.3
export ISO_CHECKSUM=e9b92ebba06383653b6ad2da404326a0
export PACKER_BOOT_WAIT=120s

packer build -except=vsphere-upload ./vsphere.json
```

## Example with vSphere Upload

This will create the VM and then upload it to vSphere and mark it as a template.

```
export RANCHEROS_VERSION=1.4.3
export ISO_CHECKSUM=e9b92ebba06383653b6ad2da404326a0
export PACKER_BOOT_WAIT=120s

export GOVC_URL=your-vcsa.url.here
export GOVC_INSECURE=true
export GOVC_USERNAME=administrator@vsphere.local
export GOVC_PASSWORD=yourpassword
export GOVC_DATACENTER=yourdatacenter
export GOVC_CLUSTER=yourcluster
export GOVC_DATASTORE=yourdatastore
export GOVC_VM_NETWORK=yournetwork
export GOVC_VM_FOLDER=yourfolder

packer build ./vsphere.json
```

## Terraform Details

When deploying the template with Terraform, you will need to include the `cloud-config` data by adding a `template_file` and rendering the content into the `guestinfo` fields.

Add this to your VM resource:

```
  extra_config {
    "guestinfo.cloud-init.config.data" = "${base64encode("${data.template_file.nameoftemplate.rendered}")}"
    "guestinfo.cloud-init.data.encoding" = "base64"
  }
```
