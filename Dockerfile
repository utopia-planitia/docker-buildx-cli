FROM docker:27.5.0@sha256:45b80efde6892498e1160c3be8eb7cc67732863caac98d2a79af24398ff1c106 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.19.3
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.5.0@sha256:45b80efde6892498e1160c3be8eb7cc67732863caac98d2a79af24398ff1c106
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
