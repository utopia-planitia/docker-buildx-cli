FROM docker:27.0.3@sha256:bc6574658b21b05655c38193a123692dfbec7cb54c9b390249b6dce141653cc6 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.15.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.0.3@sha256:bc6574658b21b05655c38193a123692dfbec7cb54c9b390249b6dce141653cc6
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
