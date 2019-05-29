FROM golang:1.11.3

ARG PACKER_BOOT_WAIT=60s
ARG RANCHEROS_VERSION
ARG AWS_IMAGE_BUILD_NUMBER

RUN go get github.com/hashicorp/packer

RUN apt-get update \
    && apt-get install -yq qemu-system-x86 python-pip python-yaml gawk \
    && pip install awscli

ENV DAPPER_SOURCE /source
ENV DAPPER_ENV AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY
ENV DAPPER_RUN_ARGS --device=/dev/kvm:/dev/kvm --privileged
ENV DAPPER_OUTPUT ./dist
WORKDIR ${DAPPER_SOURCE}

ENV RANCHEROS_VERSION=${RANCHEROS_VERSION} \
    AWS_IMAGE_BUILD_NUMBER=${AWS_IMAGE_BUILD_NUMBER:-1} \
    PACKER_BOOT_WAIT=${PACKER_BOOT_WAIT}

ENTRYPOINT ["./scripts/entry"]
CMD ["ci"]
