FROM docker:23.0.3@sha256:a2e34bde4cb23eaef4f3d5016c78f4a7ee06b65f80d07c7ba69a1e262977a97a AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.10.4
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:23.0.3@sha256:a2e34bde4cb23eaef4f3d5016c78f4a7ee06b65f80d07c7ba69a1e262977a97a
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
