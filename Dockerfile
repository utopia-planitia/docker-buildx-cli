FROM docker:23.0.6@sha256:064b3ab5253f812c4fa076b74910435df0c8c7c3e7321330592f2ee50c894619 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.10.4
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:23.0.6@sha256:064b3ab5253f812c4fa076b74910435df0c8c7c3e7321330592f2ee50c894619
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
