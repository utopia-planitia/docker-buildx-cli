FROM docker:24.0.5@sha256:9ec413dbffb3e75b95d68a746a5ec3451afa6836cc5bce03a856a826c5ad0b12 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.11.2
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:24.0.5@sha256:9ec413dbffb3e75b95d68a746a5ec3451afa6836cc5bce03a856a826c5ad0b12
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
