# Packer Build Scripts for RancherOS
---

## Purpose

These scripts are used to build RancherOS for Vagrant, Amazon and GCE.

## Release process

Once you have pushed the `rancher/os:vX.Y.Z` image to the hub.

Then run `RANCHEROS_VERSION=vX.Y.Z make test-build` to publish a private test version of the optimised
and un-optimised AMI's to Amazon. Test these by making new EC2 machines.

Once that's tested you can go on to publish the full set of AMI's and the GCE image
using `RANCHEROS_VERSION=vX.Y.Z make release`. (and for now, you need to upload the gce image using
`gsutil cp ./rancheros-${RANCHEROS_VERSION}.tar.gz gs://ros-images/`.


## License

Copyright (c) 2014-2019 [Rancher Labs, Inc.](http://rancher.com)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

[http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
